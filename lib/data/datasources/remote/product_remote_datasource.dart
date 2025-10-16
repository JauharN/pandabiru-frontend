import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/product_model.dart';

part 'product_remote_datasource.g.dart';

@RestApi()
abstract class ProductRemoteDataSource {
  factory ProductRemoteDataSource(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ProductRemoteDataSource;

  @GET('/products')
  Future<List<ProductModel>> getProducts();
}
