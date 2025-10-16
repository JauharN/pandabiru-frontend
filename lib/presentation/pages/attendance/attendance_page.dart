import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../data/providers/report_providers.dart';
import '../../../domain/entities/report.dart';
import '../../../domain/usecases/report/submit_attendance_usecase.dart';
import '../../providers/attendance_status_provider.dart';

class AttendancePage extends ConsumerWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSubmitting = ref.watch(attendanceSubmittingProvider);
    final todayDoneAsync = ref.watch(attendanceTodayDoneProvider);
    final totalPresentAsync = ref.watch(attendanceTotalPresentProvider);
    final todayStatusAsync = ref.watch(attendanceTodayStatusProvider);
    final selectedStatus = ref.watch(attendanceStatusSelectionProvider);
    final theme = Theme.of(context);
    final now = DateTime.now();
    final dateLabel = DateFormat('d MMM yyyy', 'id_ID').format(now);
    final timeLabel = DateFormat('HH : mm').format(now);

    return Scaffold(
      appBar: AppBar(title: const Text('Absen')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: todayDoneAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => _ErrorState(
            message: 'Gagal cek status absen: $e',
            onRetry: () => ref.refresh(attendanceTodayDoneProvider),
          ),
          data: (todayDone) {
            if (totalPresentAsync.isLoading || todayStatusAsync.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (totalPresentAsync.hasError) {
              return _ErrorState(
                message: 'Gagal memuat statistik absen',
                onRetry: () => ref.refresh(attendanceTotalPresentProvider),
              );
            }

            if (todayStatusAsync.hasError) {
              return _ErrorState(
                message: 'Gagal membaca status hari ini',
                onRetry: () => ref.refresh(attendanceTodayStatusProvider),
              );
            }

            final totalPresent = totalPresentAsync.value ?? 0;
            final todayStatus =
                todayStatusAsync.value ??
                (todayDone ? AttendanceStatusChoice.present : null);

            String headline;
            if (todayDone) {
              headline = switch (todayStatus) {
                AttendanceStatusChoice.present =>
                  'Kamu sudah absen hadir hari ini.',
                AttendanceStatusChoice.absent =>
                  'Kamu melaporkan tidak hadir hari ini.',
                null => 'Kamu sudah mengirim laporan hari ini.',
              };
            } else {
              headline = 'Pilih status kehadiranmu hari ini.';
            }

            Widget buildStatusButton(AttendanceStatusChoice status) {
              final isActive = status == selectedStatus;
              return Expanded(
                child: FilledButton.tonal(
                  onPressed: todayDone
                      ? null
                      : () =>
                            ref
                                    .read(
                                      attendanceStatusSelectionProvider
                                          .notifier,
                                    )
                                    .state =
                                status,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: isActive
                        ? theme.colorScheme.primaryContainer
                        : theme.colorScheme.surfaceContainerHighest,
                  ),
                  child: Text(
                    status.label,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isActive
                          ? theme.colorScheme.onPrimaryContainer
                          : theme.colorScheme.onSurfaceVariant,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
              );
            }

            Future<void> submitAttendance(AttendanceStatusChoice status) async {
              ref.read(attendanceSubmittingProvider.notifier).state = true;
              try {
                final uc = SubmitAttendanceUseCase(
                  ref.read(reportRepositoryProvider),
                );
                final res = await uc(
                  AttendanceReport(storeId: 0, status: status.payload),
                );

                await res.when(
                  success: (_) async {
                    await _completeLocalAttendance(ref, status);
                    if (context.mounted) context.go('/stores');
                  },
                  failure: (f) async {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Gagal absen: ${f.message}. Laporan akan diantar ketika online.',
                          ),
                        ),
                      );
                    }
                    await _completeLocalAttendance(ref, status);
                    if (context.mounted) context.go('/stores');
                  },
                );
              } finally {
                ref.read(attendanceSubmittingProvider.notifier).state = false;
              }
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dateLabel, style: theme.textTheme.titleMedium),
                Text(
                  timeLabel,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  headline,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Total hadir bulan ini: $totalPresent kali',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                if (!todayDone) ...[
                  Row(
                    children: [
                      buildStatusButton(AttendanceStatusChoice.present),
                      const SizedBox(width: 12),
                      buildStatusButton(AttendanceStatusChoice.absent),
                    ],
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: isSubmitting
                        ? null
                        : () => submitAttendance(selectedStatus),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: isSubmitting
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2.4),
                          )
                        : const Text('Kirim Laporan'),
                  ),
                ] else ...[
                  FilledButton(
                    onPressed: () => context.go('/stores'),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: const Text('Lanjutkan ke daftar toko'),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _completeLocalAttendance(
    WidgetRef ref,
    AttendanceStatusChoice status,
  ) async {
    await ref.read(attendanceServiceProvider).markToday(status);
    ref.invalidate(attendanceTodayDoneProvider);
    ref.invalidate(attendanceTodayStatusProvider);
    ref.invalidate(attendanceTotalPresentProvider);
    ref.read(attendanceStatusSelectionProvider.notifier).state =
        AttendanceStatusChoice.present;
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          FilledButton(onPressed: onRetry, child: const Text('Coba lagi')),
        ],
      ),
    );
  }
}
