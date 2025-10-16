import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../domain/entities/store.dart';
import '../../providers/store_detail_provider.dart';

class StoreDetailPage extends ConsumerWidget {
  final int id;
  final Store? initial; // opsional: dikirim dari list biar header cepat muncul
  const StoreDetailPage({super.key, required this.id, this.initial});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(storeByIdProvider(id));

    return async.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: _Error(
          message: e.toString(),
          onRetry: () => ref.refresh(storeByIdProvider(id)),
        ),
      ),
      data: (store) => _DetailScaffold(store: store),
    );
  }
}

class _DetailScaffold extends StatelessWidget {
  final Store store;
  const _DetailScaffold({required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(store.name)),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          _HeaderImage(url: store.imageUrl),
          const SizedBox(height: 12),
          _InfoCard(store: store),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _CtaButton(
                    icon: Icons.inventory_2_outlined,
                    label: 'Produk',
                    onTap: () {
                      // arahkan ke list produk (untuk sekarang global; Step 7 akan per-toko)
                      context.push(
                        '/stores/${store.id}/products',
                        extra: store,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _CtaButton(
                    icon: Icons.percent_outlined,
                    label: 'Promo',
                    onTap: () {
                      context.push('/stores/${store.id}/promo', extra: store);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final String? url;
  const _HeaderImage({this.url});

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return Container(
        height: 180,
        color: Colors.grey.shade300,
        child: const Icon(Icons.store_outlined, size: 64),
      );
    }
    final safe = Uri.encodeFull(url!);
    return CachedNetworkImage(
      imageUrl: safe,
      height: 180,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Store store;
  const _InfoCard({required this.store});

  @override
  Widget build(BuildContext context) {
    final gray = Theme.of(context).colorScheme.onSurface.withValues(alpha: .75);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueGrey.shade100),
        ),
        child: Column(
          children: [
            Text(
              store.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            Text(
              store.code,
              style: TextStyle(color: gray, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            if (store.address?.isNotEmpty == true)
              Text(
                store.address!,
                textAlign: TextAlign.center,
                style: TextStyle(color: gray),
              ),
            const SizedBox(height: 12),
            Text(
              'Deskripsi Toko',
              style: TextStyle(color: gray, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            if (store.owner?.isNotEmpty == true)
              Text('Pemilik : ${store.owner}', style: TextStyle(color: gray)),
            if (store.phone?.isNotEmpty == true)
              Text('No HP : ${store.phone}', style: TextStyle(color: gray)),
            Text(
              'Jam Operasional : ${store.operatingHours} WIB',
              style: TextStyle(color: gray),
            ),
          ],
        ),
      ),
    );
  }
}

class _CtaButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _CtaButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF7899A5), // nuansa biru-abu lembut
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 32),
              const SizedBox(height: 6),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Error extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _Error({required this.message, required this.onRetry});
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
        const SizedBox(height: 12),
        Text(message, textAlign: TextAlign.center),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: const Text('Coba Lagi'),
        ),
      ],
    ),
  );
}
