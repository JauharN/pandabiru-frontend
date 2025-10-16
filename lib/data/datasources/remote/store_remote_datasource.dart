import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/store_model.dart';

part 'store_remote_datasource.g.dart';

@RestApi()
abstract class StoreRemoteDataSource {
  factory StoreRemoteDataSource(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _StoreRemoteDataSource;

  @GET('/stores')
  Future<List<StoreModel>> getStores();

  @GET('/stores/{id}')
  Future<StoreModel> getStoreById(@Path('id') int id);
}
