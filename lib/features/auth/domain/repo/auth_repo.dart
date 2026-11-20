import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {

  Future<BaseResponse<List<UserEntity>>> login(
      String email,
      String password);
}