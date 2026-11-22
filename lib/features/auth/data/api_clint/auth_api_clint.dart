import 'package:exam_app_elevate/core/constants/api_endpoints.dart';
import 'package:exam_app_elevate/features/auth/data/models/auth_response_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/login_request_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'auth_api_clint.g.dart';
@LazySingleton()
@RestApi()
abstract class AuthApiClint {
  @factoryMethod
  factory AuthApiClint(Dio dio) = _AuthApiClint;


  @POST(ApiEndpoints.login)
  Future<AuthResponseModel> login(@Body() LoginRequestModel body);
}