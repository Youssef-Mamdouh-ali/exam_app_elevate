import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepo _authRepo;

  VerifyResetCodeUseCase(this._authRepo);

  Future<BaseResponse<void>> call(String code) {
    return _authRepo.verifyResetCode(code);
  }
}
