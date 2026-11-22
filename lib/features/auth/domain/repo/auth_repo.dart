import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {

  Future<BaseResponse<AuthEntity>> login(
      String email,
      String password,
      bool rememberMe,
      );

  Future<BaseResponse<void>> removeToken();
  Future<BaseResponse<String>> getToken();

}