import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/configure/base_response/safe_api_call.dart';
import 'package:exam_app_elevate/configure/di/app_environment.dart';
import 'package:exam_app_elevate/features/auth/data/api/auth_api_client.dart';
import 'package:exam_app_elevate/features/auth/data/models/forgot_password_request_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/reset_password_request_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/verify_reset_code_request_model.dart';
import 'package:injectable/injectable.dart';

import 'forget_password_remote_data_source.dart';

@Injectable(as: ForgotPasswordRemoteDataSource, env: [AppEnvironment.prod])
class AuthRemoteDataSourceImpl implements ForgotPasswordRemoteDataSource {
  final AuthApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<BaseResponse<void>> forgotPassword(String email) => safeApiCall(
    () => _apiClient.forgotPassword(ForgotPasswordRequestModel(email: email)),
  );

  @override
  Future<BaseResponse<void>> verifyResetCode(String code) => safeApiCall(
    () => _apiClient.verifyResetCode(
      VerifyResetCodeRequestModel(resetCode: code),
    ),
  );

  @override
  Future<BaseResponse<void>> resetPassword(String email, String newPassword) =>
      safeApiCall(
        () => _apiClient.resetPassword(
          ResetPasswordRequestModel(email: email, newPassword: newPassword),
        ),
      );
}
