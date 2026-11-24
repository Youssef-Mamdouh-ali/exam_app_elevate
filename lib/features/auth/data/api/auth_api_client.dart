import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/constants/api_endpoints.dart';
import 'package:exam_app_elevate/features/auth/data/models/auth_response_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/register_request_model.dart';
import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {

  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApiEndpoints.signup)
  Future<AuthResponseModel> signUp(@Body() RegisterRequestModel model);


}