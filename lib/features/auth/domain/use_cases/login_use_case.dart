import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase(this.authRepo);


  Future<BaseResponse<AuthEntity>> call(String email, String password,
      {bool rememberMe=false}) async {
    return await authRepo.login(email, password, rememberMe);
  }
}