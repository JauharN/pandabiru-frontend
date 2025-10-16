import 'package:go_router/go_router.dart';

import '../../domain/entities/store.dart';

import '../pages/splash/splash_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/attendance/attendance_page.dart';
import '../pages/store/store_list_page.dart';
import '../pages/store/store_detail_page.dart';
import '../pages/product/product_list_page.dart';
import '../pages/promo/promo_page.dart';
import '../pages/info/info_page.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/attendance',
      builder: (context, state) => const AttendancePage(),
    ),
    GoRoute(
      path: '/stores',
      builder: (context, state) => const StoreListPage(),
    ),
    GoRoute(path: '/info', builder: (context, state) => const InfoPage()),

    // optional: list produk global (bukan per-toko)
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductListPage(),
    ),

    // detail toko
    GoRoute(
      path: '/stores/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final initial = state.extra as Store?;
        return StoreDetailPage(id: id, initial: initial);
      },
    ),

    // produk per toko
    GoRoute(
      path: '/stores/:id/products',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ProductListPage(storeId: id);
      },
    ),

    // promo per toko
    GoRoute(
      path: '/stores/:id/promo',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return PromoPage(storeId: id);
      },
    ),
  ],
);
