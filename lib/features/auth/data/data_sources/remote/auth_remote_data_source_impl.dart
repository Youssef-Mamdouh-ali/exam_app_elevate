import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/data/api/auth_api_client.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:exam_app_elevate/features/auth/data/models/auth_response_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/register_request_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
final AuthApiClient _authApiClint;
AuthRemoteDataSourceImpl(this._authApiClint);

  @override
  Future<BaseResponse<AuthResponseModel>> signUp(RegisterRequestModel model) async{
    try{
      AuthResponseModel response = await _authApiClint.signUp(model);
      return SuccessBaseResponse<AuthResponseModel>(response);
    }catch(e){
      return ErrorBaseResponse<AuthResponseModel>.fromError(e);
    }
  }

}