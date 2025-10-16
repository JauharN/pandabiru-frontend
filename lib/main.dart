// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'data/models/product_model.dart';
import 'data/models/store_model.dart';
import 'presentation/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  await Hive.initFlutter();

  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(StoreModelAdapter());
  await Hive.openBox('storesBox');
  await Hive.openBox('productsBox');
  await Hive.openBox('syncQueueBox');
  await Hive.openBox('kvBox');

  runApp(const ProviderScope(child: PandaBiruApp()));
}

class PandaBiruApp extends StatelessWidget {
  const PandaBiruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Panda Biru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF6FA4AF), // warna utama kamu
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
