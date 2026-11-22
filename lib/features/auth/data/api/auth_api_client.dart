import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/constants/api_endpoints.dart';
import 'package:exam_app_elevate/features/auth/data/models/auth_response_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/forgot_password_request_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/login_request_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/reset_password_request_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/verify_reset_code_request_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {

  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApiEndpoints.forgotPassword)
  Future<void> forgotPassword(@Body() ForgotPasswordRequestModel request);

  @POST(ApiEndpoints.verifyResetCode)
  Future<void> verifyResetCode(@Body() VerifyResetCodeRequestModel request);

  @PUT(ApiEndpoints.resetPassword)
  Future<void> resetPassword(@Body() ResetPasswordRequestModel request);


  @POST(ApiEndpoints.login)
  Future<AuthResponseModel> login(@Body() LoginRequestModel body);
}
