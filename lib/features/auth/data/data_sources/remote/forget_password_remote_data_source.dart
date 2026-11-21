import 'package:exam_app_elevate/configure/base_response/base_response.dart';

abstract interface class ForgotPasswordRemoteDataSource {

  Future<BaseResponse<void>> forgotPassword(String email);

  Future<BaseResponse<void>> verifyResetCode(String code);

  Future<BaseResponse<void>> resetPassword(String email, String newPassword);
}
