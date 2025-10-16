import '../../core/utils/result.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> getProducts({bool forceRefresh = false});
  Future<Result<void>> clearCache();
}
