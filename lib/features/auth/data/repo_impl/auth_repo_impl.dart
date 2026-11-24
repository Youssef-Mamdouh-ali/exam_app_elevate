import 'dart:developer';

import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:exam_app_elevate/features/auth/data/models/auth_response_model.dart';
import 'package:exam_app_elevate/features/auth/data/models/register_request_model.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource );

  @override
  Future<BaseResponse<AuthEntity>> signUp(RegisterRequestModel model) async{
    BaseResponse<AuthResponseModel> response = await authRemoteDataSource.signUp(model);

    switch(response){
      case SuccessBaseResponse<AuthResponseModel>():
        final AuthEntity auth = response.data.toEntity();
        log('Success$response');
        return SuccessBaseResponse<AuthEntity>(auth);
      case ErrorBaseResponse<AuthResponseModel>():
        return ErrorBaseResponse<AuthEntity>(response.message);
    }
  }

}