import 'package:pandabiru_app/core/utils/result.dart';
import 'package:pandabiru_app/domain/entities/store.dart';
import 'package:pandabiru_app/domain/repositories/store_repository.dart';

class GetStoresUsecase {
  final StoreRepository _repo;
  GetStoresUsecase(this._repo);

  Future<Result<List<Store>>> call({bool forceRefresh = false}) =>
      _repo.getStores(forceRefresh: forceRefresh);
}
