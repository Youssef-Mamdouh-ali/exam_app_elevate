import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/remote/forget_password_remote_data_source.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final ForgotPasswordRemoteDataSource _forgotPasswordRemoteDataSource;

  AuthRepoImpl(this._forgotPasswordRemoteDataSource);

  @override
  Future<BaseResponse<void>> forgotPassword(String email) {
    return _forgotPasswordRemoteDataSource.forgotPassword(email);
}

  @override
  Future<BaseResponse<AuthEntity>> signUp(RegisterRequestModel model) async{
    BaseResponse<AuthResponseModel> response = await authRemoteDataSource.signUp(model);

    switch(response){
      case SuccessBaseResponse<AuthResponseModel>():
        final AuthEntity auth = response.data.toEntity();

        return SuccessBaseResponse<AuthEntity>(auth);
      case ErrorBaseResponse<AuthResponseModel>():
        return ErrorBaseResponse<AuthEntity>(response.message);
    }
  }

  @override
  Future<BaseResponse<void>> verifyResetCode(String code) {
    return _forgotPasswordRemoteDataSource.verifyResetCode(code);
  }

  @override
  Future<BaseResponse<void>> resetPassword(String email, String newPassword) {
    return _forgotPasswordRemoteDataSource.resetPassword(email, newPassword);
  }
}