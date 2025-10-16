import 'package:pandabiru_app/core/utils/result.dart';
import 'package:pandabiru_app/domain/entities/store.dart';
import 'package:pandabiru_app/domain/repositories/store_repository.dart';

class GetStoreByIdUsecase {
  final StoreRepository _repo;
  GetStoreByIdUsecase(this._repo);

  Future<Result<Store>> call(int id) => _repo.getStoreById(id);
}
