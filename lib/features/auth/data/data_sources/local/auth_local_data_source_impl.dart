
import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource{

  final FlutterSecureStorage _storage;

  AuthLocalDataSourceImpl(this._storage);



  @override
  Future<BaseResponse<String>> getToken() async{

    try{
      final token = await _storage.read(key: AppStrings.tokenKey);
      if(token == null  || token.isEmpty){
        return ErrorBaseResponse(AppStrings.somethingWentWrong);
      }

      return SuccessBaseResponse<String>(token);
    }catch(e){
      return ErrorBaseResponse(e.toString());
    }
  }

  @override
  Future<BaseResponse<void>> removeToken()async {
    try {
      await _storage.delete(key: AppStrings.tokenKey);

      return SuccessBaseResponse<void>(null);
    } catch (e) {
      return ErrorBaseResponse<void>(e.toString());
    }
  }

  @override
  Future<BaseResponse<void>> saveToken(String token) async{
    try {
      await _storage.write(
        key: AppStrings.tokenKey,
        value: token,
      );

      return SuccessBaseResponse<void>(null);
    } catch (e) {
      return ErrorBaseResponse<void>(e.toString());
    }
  }


}