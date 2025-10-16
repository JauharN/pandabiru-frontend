import '../../entities/product.dart';
import '../../repositories/product_repository.dart';

import '../../../core/utils/result.dart';

class GetProductsUsecase {
  final ProductRepository _repo;
  GetProductsUsecase(this._repo);

  Future<Result<List<Product>>> call({bool forceRefresh = false}) =>
      _repo.getProducts(forceRefresh: forceRefresh);
}
