import 'package:dio/dio.dart' hide Headers;
import 'package:pandabiru_app/data/models/auth/login_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/constants/api_constants.dart';
import '../../models/auth/login_request_model.dart';

part 'auth_remote_datasource.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AuthRemoteDataSource;

  @Headers({'Content-Type': 'application/json', 'Accept': 'application/json'})
  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel body);

  @Headers({'Accept': 'application/json'})
  @POST(ApiConstants.logout)
  Future<void> logout();
}
