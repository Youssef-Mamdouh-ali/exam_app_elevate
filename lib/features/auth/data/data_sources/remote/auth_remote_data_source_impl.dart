import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/features/auth/data/api/auth_api_client.dart';
import 'package:exam_app_elevate/features/auth/data/models/forgot_password_request_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/reset_password_request_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/verify_reset_code_request_model.dart';
import 'package:injectable/injectable.dart';

import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource, env: [AppStrings.prod])
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<BaseResponse<void>> forgotPassword(String email) async {
    try {
      await _apiClient.forgotPassword(ForgotPasswordRequestModel(email: email));
      return SuccessBaseResponse(null);
    } catch (e) {
      return ErrorBaseResponse.fromError(e);
    }
  }

  @override
  Future<BaseResponse<void>> verifyResetCode(String code) async {
    try {
      await _apiClient.verifyResetCode(
        VerifyResetCodeRequestModel(resetCode: code),
      );
      return SuccessBaseResponse(null);
    } catch (e) {
      return ErrorBaseResponse.fromError(e);
    }
  }

  @override
  Future<BaseResponse<void>> resetPassword(
    String email,
    String newPassword,
  ) async {
    try {
      await _apiClient.resetPassword(
        ResetPasswordRequestModel(email: email, newPassword: newPassword),
      );
      return SuccessBaseResponse(null);
    } catch (e) {
      return ErrorBaseResponse.fromError(e);
    }
  }
}
