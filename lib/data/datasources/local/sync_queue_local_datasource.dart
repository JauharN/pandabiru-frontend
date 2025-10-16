import 'package:hive/hive.dart';

enum ReportContext { attendance, availability, promo }

class QueueItem {
  final String id;
  final ReportContext context;
  final Map<String, dynamic> payload;
  final DateTime createdAt;
  final int retry;

  QueueItem({
    required this.id,
    required this.context,
    required this.payload,
    required this.createdAt,
    this.retry = 0,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'context': context.name,
    'payload': payload,
    'createdAt': createdAt.toIso8601String(),
    'retry': retry,
  };

  static QueueItem fromMap(Map<String, dynamic> m) => QueueItem(
    id: m['id'] as String,
    context: ReportContext.values.firstWhere((e) => e.name == m['context']),
    payload: Map<String, dynamic>.from(m['payload'] as Map),
    createdAt: DateTime.parse(m['createdAt'] as String),
    retry: (m['retry'] as num?)?.toInt() ?? 0,
  );
}

abstract class SyncQueueLocalDataSource {
  Future<void> enqueue(QueueItem item);
  Future<List<QueueItem>> all();
  Future<void> remove(String id);
  Future<void> clear();
  int size();
}

class SyncQueueLocalDataSourceImpl implements SyncQueueLocalDataSource {
  static const _boxName = 'syncQueueBox';
  Box get _box => Hive.box(_boxName);

  @override
  Future<void> enqueue(QueueItem item) async {
    final list = await all();
    list.add(item);
    await _box.put('items', list.map((e) => e.toMap()).toList());
  }

  @override
  Future<List<QueueItem>> all() async {
    final raw = _box.get('items') as List<dynamic>?;
    if (raw == null) return [];
    return raw
        .map((e) => QueueItem.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<void> remove(String id) async {
    final list = await all();
    list.removeWhere((e) => e.id == id);
    await _box.put('items', list.map((e) => e.toMap()).toList());
  }

  @override
  Future<void> clear() => _box.delete('items');

  @override
  int size() {
    final raw = _box.get('items') as List<dynamic>?;
    return raw?.length ?? 0;
  }
}
