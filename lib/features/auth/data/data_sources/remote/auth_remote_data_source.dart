import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/data/models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<AuthResponseModel>> login(String email, String password);
}