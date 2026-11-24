import 'package:dio/dio.dart';
import 'package:exam_app_elevate/features/auth/data/api/auth_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @singleton
  AuthApiClient authApiClient(Dio dio) => AuthApiClient(dio);
}