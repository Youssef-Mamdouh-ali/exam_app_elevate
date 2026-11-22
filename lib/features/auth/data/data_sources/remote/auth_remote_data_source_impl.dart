import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/data/api_clint/auth_api_clint.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:exam_app_elevate/features/auth/data/models/auth_response_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/login_request_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final AuthApiClint _authApiClint;
  AuthRemoteDataSourceImpl(this._authApiClint);

  @override
  Future<BaseResponse<AuthResponseModel>> login(String email, String password)async {

    try{
      AuthResponseModel response=await _authApiClint.login(
          LoginRequestModel(email:email, password: password)
      );


      return SuccessBaseResponse<AuthResponseModel>(response);
    }catch(e){
      return ErrorBaseResponse<AuthResponseModel>( e.toString());
    }
  }

 

}