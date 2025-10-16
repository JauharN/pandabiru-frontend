import 'package:pandabiru_app/data/models/summary_model.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

import '../../core/errors/failures.dart';
import '../../core/network/network_info.dart';
import '../../core/utils/result.dart';
import '../../domain/entities/report.dart';
import '../../domain/entities/summary.dart';
import '../../domain/repositories/report_repository.dart';
import '../datasources/local/sync_queue_local_datasource.dart';
import '../datasources/remote/report_remote_datasource.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource remote;
  final SyncQueueLocalDataSource queue;
  final NetworkInfo network;

  ReportRepositoryImpl({
    required this.remote,
    required this.queue,
    required this.network,
  });

  @override
  Future<Result<void>> submitAttendance(AttendanceReport r) async {
    final body = {
      'status': r.status,
      'timestamp': (r.timestamp ?? DateTime.now()).toIso8601String(),
      'store_id': r.storeId,
      if (r.lat != null) 'lat': r.lat,
      if (r.lon != null) 'lon': r.lon,
      if (r.note != null) 'note': r.note,
    };
    return _postOrQueue('attendance', body);
  }

  @override
  Future<Result<void>> submitAvailability(AvailabilityReport r) async {
    final body = {
      'store_id': r.storeId,
      'client_uuid': r.clientUuid ?? const Uuid().v4(),
      'items': r.items
          .map(
            (e) => {
              'product_id': e.productId,
              'available': e.available,
              if (e.barcode != null) 'barcode': e.barcode,
              if (e.note != null) 'note': e.note,
            },
          )
          .toList(),
    };
    return _postOrQueue('availability', body);
  }

  @override
  Future<Result<void>> submitPromo(PromoReport r) async {
    final body = {
      'store_id': r.storeId,
      'title': r.title,
      if (r.description != null) 'description': r.description,
      if (r.productIds != null) 'products': r.productIds,
      if (r.startDate != null) 'start_date': r.startDate!.toIso8601String(),
      if (r.endDate != null) 'end_date': r.endDate!.toIso8601String(),
    };
    return _postOrQueue('promo', body);
  }

  Future<Result<void>> _postOrQueue(
    String context,
    Map<String, dynamic> body,
  ) async {
    try {
      if (await network.isConnected) {
        await remote.submitReport(context, body);
        return const Result.success(null);
      }
      await queue.enqueue(
        QueueItem(
          id: const Uuid().v4(),
          context: _contextFromString(context),
          payload: body,
          createdAt: DateTime.now(),
        ),
      );
      return const Result.success(null);
    } on DioException catch (e) {
      // server error -> queue juga (tidak hilang)
      await queue.enqueue(
        QueueItem(
          id: const Uuid().v4(),
          context: _contextFromString(context),
          payload: body,
          createdAt: DateTime.now(),
        ),
      );
      return Result.failure(
        Failure.server(e.message ?? 'Server error, queued'),
      );
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  ReportContext _contextFromString(String s) {
    switch (s) {
      case 'attendance':
        return ReportContext.attendance;
      case 'availability':
        return ReportContext.availability;
      default:
        return ReportContext.promo;
    }
  }

  @override
  Future<int> flushQueue() async {
    if (!await network.isConnected) return 0;
    final items = await queue.all();
    int sent = 0;
    for (final it in items) {
      try {
        await remote.submitReport(it.context.name, it.payload);
        await queue.remove(it.id);
        sent++;
      } catch (_) {
        // biarkan di queue
      }
    }
    return sent;
  }

  @override
  Future<Result<Summary>> getSummary() async {
    try {
      final m = await remote.getSummary();
      final pending = queue.size();
      return Result.success(m.toEntity(pendingQueue: pending));
    } on DioException catch (e) {
      return Result.failure(Failure.server(e.message ?? 'Server error'));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }
}
