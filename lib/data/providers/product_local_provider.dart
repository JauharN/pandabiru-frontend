import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/local/product_local_datasource.dart';

final productLocalDataSourceProvider = Provider<ProductLocalDataSource>((ref) {
  return ProductLocalDataSourceImpl();
});
