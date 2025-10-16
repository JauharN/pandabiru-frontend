import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/product.dart';
import '../../providers/availability_providers.dart';
import '../../providers/product_provider.dart';

class ProductListPage extends ConsumerWidget {
  final int? storeId;
  const ProductListPage({super.key, this.storeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productListControllerProvider);
    final title = storeId == null ? 'Daftar Produk' : 'Produk Toko';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(productListControllerProvider.notifier).refresh(),
        child: state.when(
          loading: () => const _LoadingList(),
          error: (e, _) => _ErrorView(
            message: e.toString(),
            onRetry: () =>
                ref.read(productListControllerProvider.notifier).refresh(),
          ),
          data: (items) => items.isEmpty
              ? _EmptyView(
                  onRetry: () => ref
                      .read(productListControllerProvider.notifier)
                      .refresh(),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  // Menggunakan _ProductRow yang sudah benar
                  itemBuilder: (_, i) =>
                      _ProductRow(product: items[i], storeId: storeId),
                ),
        ),
      ),
    );
  }
}

class _ProductRow extends ConsumerWidget {
  final Product product;
  final int? storeId;
  const _ProductRow({required this.product, required this.storeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasStore = storeId != null;
    final avail = hasStore
        ? ref.watch(availabilityProvider(storeId!))
        : const <int, bool>{};
    final checked = hasStore ? (avail[product.id] ?? false) : false;

    // Menggabungkan barcode dan size untuk subtitle
    final subtitleText = [
      if (product.barcode?.isNotEmpty == true) product.barcode!,
      if (product.size?.isNotEmpty == true) product.size!,
    ].join(' | ');

    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: _Thumb(imageUrl: product.imageUrl),
        title: Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          subtitleText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 13, color: Colors.grey[700]),
        ),
        trailing: hasStore
            ? Checkbox(
                value: checked,
                onChanged: (v) {
                  if (v == null) return;
                  ref
                      .read(availabilityProvider(storeId!).notifier)
                      .toggle(product.id, v, barcode: product.barcode);
                },
              )
            : null,
        onTap: () {},
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  final String? imageUrl;
  const _Thumb({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    const w = 72.0, h = 72.0;
    final r = BorderRadius.circular(10);
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        width: w,
        height: h,
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: r),
        child: const Icon(Icons.image_outlined, color: Colors.grey),
      );
    }
    return ClipRRect(
      borderRadius: r,
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        width: w,
        height: h,
        fit: BoxFit.cover,
        placeholder: (_, __) =>
            Container(width: w, height: h, color: Colors.grey.shade200),
        errorWidget: (_, __, ___) => Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: r,
          ),
          child: const Icon(Icons.broken_image_outlined),
        ),
      ),
    );
  }
}

class _LoadingList extends StatelessWidget {
  const _LoadingList();
  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.all(16),
    itemCount: 6,
    separatorBuilder: (_, __) => const SizedBox(height: 12),
    itemBuilder: (_, __) => Container(
      height: 96,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
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
      Icon(Icons.inventory_2_outlined, size: 72, color: Colors.grey.shade400),
      const SizedBox(height: 12),
      const Center(
        child: Text('Belum ada data produk', style: TextStyle(fontSize: 16)),
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
