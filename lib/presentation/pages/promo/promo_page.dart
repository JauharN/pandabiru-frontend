import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers/report_providers.dart';
import '../../../domain/entities/report.dart';
import '../../../domain/usecases/report/submit_promo_usecase.dart';
import '../../providers/product_provider.dart';

class PromoPage extends ConsumerStatefulWidget {
  final int storeId;
  const PromoPage({super.key, required this.storeId});

  @override
  ConsumerState<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends ConsumerState<PromoPage> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _desc = TextEditingController();
  bool _sending = false;
  final _selected = <int>{};

  @override
  void dispose() {
    _title.dispose();
    _desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(
      productListControllerProvider,
    ); // list global

    return Scaffold(
      appBar: AppBar(title: const Text('Promo Toko')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _title,
                        decoration: const InputDecoration(
                          labelText: 'Judul Promo',
                        ),
                        validator: (v) =>
                            (v == null || v.isEmpty) ? 'Wajib diisi' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _desc,
                        decoration: const InputDecoration(
                          labelText: 'Deskripsi (opsional)',
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Pilih Produk (opsional):',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                productsState.when(
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (e, _) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('Gagal memuat produk: $e'),
                  ),
                  data: (items) => items.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Produk kosong.'),
                        )
                      : Column(
                          children: items
                              .map(
                                (p) => CheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  value: _selected.contains(p.id),
                                  onChanged: (v) {
                                    setState(() {
                                      if (v == true) {
                                        _selected.add(p.id);
                                      } else {
                                        _selected.remove(p.id);
                                      }
                                    });
                                  },
                                  title: Text(
                                    p.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    [
                                      if (p.barcode?.isNotEmpty == true)
                                        p.barcode!,
                                      if (p.size?.isNotEmpty == true) p.size!,
                                    ].join(' | '),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
              ],
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _sending
                    ? null
                    : () async {
                        if (!_form.currentState!.validate()) return;
                        setState(() => _sending = true);
                        final uc = SubmitPromoUseCase(
                          ref.read(reportRepositoryProvider),
                        );
                        final res = await uc(
                          PromoReport(
                            storeId: widget.storeId,
                            title: _title.text,
                            description: _desc.text,
                            productIds: _selected.isEmpty
                                ? null
                                : _selected.toList(),
                          ),
                        );
                        setState(() => _sending = false);
                        res.when(
                          success: (_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Promo terkirim (atau di-queue jika offline)',
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          failure: (f) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Gagal: ${f.message}')),
                            );
                          },
                        );
                      },
                child: _sending
                    ? const CircularProgressIndicator()
                    : const Text('Kirim Promo'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
