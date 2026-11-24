import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/configure/base_response/safe_api_call.dart';
import 'package:exam_app_elevate/features/auth/data/api/auth_api_client.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:exam_app_elevate/features/auth/data/models/auth_response_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/login_request_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final AuthApiClient _authApiClint;
  AuthRemoteDataSourceImpl(this._authApiClint);

  @override
  Future<BaseResponse<AuthResponseModel>> login(String email, String password)async {

    return safeApiCall<AuthResponseModel>(
          () => _authApiClint.login(
        LoginRequestModel(email: email, password: password),
      ),
    );
  }



}