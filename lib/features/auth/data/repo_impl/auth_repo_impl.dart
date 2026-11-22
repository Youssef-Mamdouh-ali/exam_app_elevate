import 'dart:developer';

import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:exam_app_elevate/features/auth/data/models/auth_response_model.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';
import 'package:exam_app_elevate/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
  AuthRemoteDataSource authRemoteDataSource ;
  AuthLocalDataSource authLocalDataSource;
  AuthRepoImpl(
      this.authRemoteDataSource,
      this.authLocalDataSource,
      );
  @override
  Future<BaseResponse<AuthEntity>> login(String email, String password,bool rememberMe)async {
    BaseResponse<AuthResponseModel> response= await authRemoteDataSource.login(email, password);
    switch(response){
      case SuccessBaseResponse<AuthResponseModel>():
       final AuthEntity user= response.data.toEntity();
       if(rememberMe){
         final saveTokenResponse= await authLocalDataSource.saveToken(user.token!);

         switch(saveTokenResponse){

           case SuccessBaseResponse<void>():
             return SuccessBaseResponse<AuthEntity>(user);

           case ErrorBaseResponse<void>():

             return ErrorBaseResponse.fromError(saveTokenResponse.message);
         }
       }else{
         await authLocalDataSource.removeToken();
       }
       return SuccessBaseResponse<AuthEntity>(user);
      case ErrorBaseResponse<AuthResponseModel>():
        return ErrorBaseResponse.fromError(response.message);
    }
  }

  @override
  Future<BaseResponse<String>> getToken() {
    return authLocalDataSource.getToken();
  }

  @override
  Future<BaseResponse<void>> removeToken() {
    return authLocalDataSource.removeToken();
  }


}