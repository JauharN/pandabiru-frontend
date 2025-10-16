Project Soal Interview PandaBiru App

Aplikasi Flutter (Android) untuk “Project Skill Test – Panda Biru”.
Stack: Flutter + Riverpod, Dio + Retrofit, Freezed, Hive (offline-first), GoRouter.

Fitur Utama

Flow: Splash → Login → Attendance → Store List → Store Detail → (Produk/Promo)
Stores & Products: cache offline (Hive)
Report: Attendance, Availability (checkbox per produk per toko), Promo (pilih produk)
Summary: counter harian + pending sync (manual flush)
Gambar dari backend (URL absolut)

Konfigurasi

Base URL: lib/core/constants/api_constants.dart
ApiConstants.baseUrl = 'http://<IP_LAN>:<port>/api/v1';


Android dev:

Wi-Fi: pakai http://<IP_LAN>:<port>/api/v1

Build APK
flutter build apk --release


Hive Boxes

storesBox, productsBox (cache master)
syncQueueBox (antrian report saat offline)
kvBox (flag ringan, mis. status absen harian)

Paket Utama

riverpod / hooks_riverpod
dio, retrofit, pretty_dio_logger
freezed, json_serializable, build_runner
hive, hive_flutter
go_router
cached_network_image (gambar)

Struktur Ringkas
lib/
  core/        // api constants, dio client, failures, result, etc.
  domain/      // entities, repositories (interface), usecases
  data/        // models (freezed+json), remote/local datasources, repo impl
  presentation// routes, pages, providers, widgets
