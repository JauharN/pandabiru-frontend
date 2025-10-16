import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/entities/store.dart';
import '../../providers/store_provider.dart';

class StoreListPage extends ConsumerWidget {
  const StoreListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(storeListControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Toko')),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) context.go('/info');
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            label: 'Toko',
          ),
          NavigationDestination(icon: Icon(Icons.info_outline), label: 'Info'),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(storeListControllerProvider.notifier).refresh(),
        child: state.when(
          loading: () => const _LoadingList(),
          error: (e, _) => _ErrorView(
            message: e.toString(),
            onRetry: () =>
                ref.read(storeListControllerProvider.notifier).refresh(),
          ),
          data: (stores) => stores.isEmpty
              ? _EmptyView(
                  onRetry: () =>
                      ref.read(storeListControllerProvider.notifier).refresh(),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: stores.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) => _StoreCard(store: stores[i]),
                ),
        ),
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  final Store store;
  const _StoreCard({required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.push('/stores/${store.id}', extra: store);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Thumb(imageUrl: store.imageUrl),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _CodeBadge(code: store.code),
                    const SizedBox(height: 8),
                    if (store.owner?.isNotEmpty == true)
                      _IconText(icon: Icons.person_outline, text: store.owner!),
                    if (store.phone?.isNotEmpty == true)
                      _IconText(icon: Icons.phone_outlined, text: store.phone!),
                    _OpenBadge(
                      openText: store.operatingHours,
                      isOpen: store.isOpenNow,
                    ),
                    if (store.address?.isNotEmpty == true) ...[
                      const SizedBox(height: 4),
                      _IconText(
                        icon: Icons.location_on_outlined,
                        text: store.address!,
                        maxLines: 2,
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  final String? imageUrl;
  const _Thumb({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    const w = 80.0, h = 80.0, r = 8.0;
    if (imageUrl == null || imageUrl!.isEmpty) {
      return const _EmptyThumb(w: w, h: h, r: r);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(r),
      child: CachedNetworkImage(
        // ganti ke Image.network kalau tidak pakai cached_network_image
        imageUrl: imageUrl!,
        width: w,
        height: h,
        fit: BoxFit.cover,
        placeholder: (_, __) => const _Skeleton(w: w, h: h, r: r),
        errorWidget: (_, __, ___) => const _EmptyThumb(w: w, h: h, r: r),
      ),
    );
  }
}

class _EmptyThumb extends StatelessWidget {
  final double w, h, r;
  const _EmptyThumb({required this.w, required this.h, required this.r});
  @override
  Widget build(BuildContext context) => Container(
    width: w,
    height: h,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(r),
    ),
    child: const Icon(Icons.store_outlined, color: Colors.grey, size: 28),
  );
}

class _Skeleton extends StatelessWidget {
  final double w, h, r;
  const _Skeleton({required this.w, required this.h, required this.r});
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(r),
      ),
    ),
  );
}

class _CodeBadge extends StatelessWidget {
  final String code;
  const _CodeBadge({required this.code});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      code,
      style: TextStyle(
        fontSize: 12,
        color: Colors.blue.shade700,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final int maxLines;
  const _IconText({required this.icon, required this.text, this.maxLines = 1});
  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 14, color: Colors.grey[600]),
      const SizedBox(width: 4),
      Expanded(
        child: Text(
          text,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 13, color: Colors.grey[700]),
        ),
      ),
    ],
  );
}

class _OpenBadge extends StatelessWidget {
  final String openText;
  final bool isOpen;
  const _OpenBadge({required this.openText, required this.isOpen});
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
      const SizedBox(width: 4),
      Text(openText, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
      const SizedBox(width: 6),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: isOpen ? Colors.green.shade50 : Colors.red.shade50,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          isOpen ? 'Buka' : 'Tutup',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isOpen ? Colors.green.shade700 : Colors.red.shade700,
          ),
        ),
      ),
    ],
  );
}

class _LoadingList extends StatelessWidget {
  const _LoadingList();
  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.all(16),
    itemCount: 6,
    separatorBuilder: (_, __) => const SizedBox(height: 12),
    itemBuilder: (_, __) => Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 104,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

class _EmptyView extends StatelessWidget {
  final VoidCallback onRetry;
  const _EmptyView({required this.onRetry});
  @override
  Widget build(BuildContext context) => ListView(
    physics: const AlwaysScrollableScrollPhysics(),
    padding: const EdgeInsets.all(16),
    children: [
      const SizedBox(height: 120),
      Icon(
        Icons.store_mall_directory_outlined,
        size: 72,
        color: Colors.grey.shade400,
      ),
      const SizedBox(height: 12),
      const Center(
        child: Text('Belum ada data toko', style: TextStyle(fontSize: 16)),
      ),
      const SizedBox(height: 8),
      Center(
        child: OutlinedButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: const Text('Muat Ulang'),
        ),
      ),
    ],
  );
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});
  @override
  Widget build(BuildContext context) => ListView(
    physics: const AlwaysScrollableScrollPhysics(),
    padding: const EdgeInsets.all(16),
    children: [
      const SizedBox(height: 120),
      Icon(Icons.error_outline, size: 72, color: Colors.red.shade300),
      const SizedBox(height: 12),
      Center(child: Text(message, textAlign: TextAlign.center)),
      const SizedBox(height: 8),
      Center(
        child: ElevatedButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: const Text('Coba Lagi'),
        ),
      ),
    ],
  );
}
