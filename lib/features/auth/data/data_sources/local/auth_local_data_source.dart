
import 'package:exam_app_elevate/configure/base_response/base_response.dart';

abstract class AuthLocalDataSource {
  Future<BaseResponse<void>> saveToken(String token);
  Future<BaseResponse<String>> getToken();
  Future<BaseResponse<void>> removeToken();

}