import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<void>> forgotPassword(String email) {
    return _remoteDataSource.forgotPassword(email);
  }

  @override
  Future<BaseResponse<void>> verifyResetCode(String code) {
    return _remoteDataSource.verifyResetCode(code);
  }

  @override
  Future<BaseResponse<void>> resetPassword(String email, String newPassword) {
    return _remoteDataSource.resetPassword(email, newPassword);
  }
}