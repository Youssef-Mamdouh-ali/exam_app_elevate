import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';

abstract interface class AuthRepo {

  Future<BaseResponse<void>> forgotPassword(String email);

  Future<BaseResponse<void>> verifyResetCode(String code);

  Future<BaseResponse<void>> resetPassword(String email, String newPassword);


  Future<BaseResponse<AuthEntity>> login(
      String email,
      String password,
      bool rememberMe,
      );

  Future<BaseResponse<void>> removeToken();
  Future<BaseResponse<String?>> getToken();


}