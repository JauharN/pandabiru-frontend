import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/summary_model.dart';

part 'report_remote_datasource.g.dart';

@RestApi()
abstract class ReportRemoteDataSource {
  factory ReportRemoteDataSource(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ReportRemoteDataSource;

  @POST('report/{context}')
  Future<void> submitReport(
    @Path('context') String context,
    @Body() Map<String, dynamic> body,
  );

  @GET('reports/summary')
  Future<SummaryModel> getSummary();
}
