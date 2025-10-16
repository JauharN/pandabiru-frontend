import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/local/store_local_datasource.dart';

final storeLocalDataSourceProvider = Provider<StoreLocalDataSource>((ref) {
  return StoreLocalDataSourceImpl();
});
