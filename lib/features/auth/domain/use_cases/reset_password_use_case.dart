import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ResetPasswordUseCase {
  final AuthRepo _authRepo;

  ResetPasswordUseCase(this._authRepo);

  Future<BaseResponse<void>> call(String email, String newPassword) {
    return _authRepo.resetPassword(email, newPassword);
  }
}
