import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers/product_repository_provider.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/product/get_products_usecase.dart';

final getProductsUseCaseProvider = Provider<GetProductsUsecase>((ref) {
  final repo = ref.read(productRepositoryProvider);
  return GetProductsUsecase(repo);
});

class ProductListController extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    final usecase = ref.read(getProductsUseCaseProvider);
    final res = await usecase();
    return res.when(success: (v) => v, failure: (f) => Future.error(f.message));
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final usecase = ref.read(getProductsUseCaseProvider);
    final res = await usecase(forceRefresh: true);
    state = res.when(
      success: AsyncData.new,
      failure: (f) => AsyncError(f.message, StackTrace.current),
    );
  }
}

final productListControllerProvider =
    AsyncNotifierProvider<ProductListController, List<Product>>(
      ProductListController.new,
    );
