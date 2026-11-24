import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/data/models/register_request_model.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase(this.authRepo);


  Future<BaseResponse<AuthEntity>> call(RegisterRequestModel requestModel) async {
    return await authRepo.signUp(requestModel);
  }
}