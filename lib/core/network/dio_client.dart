import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_constants.dart';
import 'interceptors/auth_interceptor.dart';

class DioClient {
  final Dio dio;

  DioClient({required AuthInterceptor authInterceptor})
    : dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          contentType: 'application/json',
          headers: {'Accept': 'application/json'},
          followRedirects: false,
          validateStatus: (s) => s != null && s < 400,
        ),
      ) {
    dio.interceptors.addAll([
      authInterceptor,
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: false,
        compact: true,
        maxWidth: 90,
      ),
    ]);
  }

  static Dio createDefault(AuthInterceptor authInterceptor) {
    final client = DioClient(authInterceptor: authInterceptor);
    return client.dio;
  }
}
