import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase(this.authRepo);


  Future<BaseResponse<List<UserEntity>>> login(String email, String password) async {
    return await authRepo.login(email, password);
  }
}

