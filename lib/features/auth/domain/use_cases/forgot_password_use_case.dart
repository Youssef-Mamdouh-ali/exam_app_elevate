import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ForgotPasswordUseCase {
  final AuthRepo _authRepo;

  ForgotPasswordUseCase(this._authRepo);

  Future<BaseResponse<void>> call(String email) {
    return _authRepo.forgotPassword(email);
  }
}
