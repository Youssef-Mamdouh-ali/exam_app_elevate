import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';
import 'package:exam_app_elevate/features/auth/domain/use_cases/login_use_case.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_events.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState>{
  final LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase): super(LoginState());

  void doEvent(LoginEvents event){
    switch(event){
      case UserLoginEvent():
        login(event.email, event.password, event.rememberMe);
        break;
    }
  }

  Future<void> login(String email, String password, bool rememberMe) async {
    emit(state.copyWith(
        userLoginState: state.userLoginState?.copyWith(
            isLoading: true
        )
    )
    );
    try{
      BaseResponse<AuthEntity> apiResult = await _loginUseCase(
          email,
          password,
          rememberMe: rememberMe
      );
      switch (apiResult) {

        case SuccessBaseResponse<AuthEntity>():
          emit(state.copyWith(
              userLoginState: state.userLoginState?.copyWith(
                  isLoading: false,
                  data: apiResult.data

              )
          )
          );
        case ErrorBaseResponse<AuthEntity>():
          emit(state.copyWith(
              userLoginState: state.userLoginState?.copyWith(
                  isLoading: false,
                  errMsg: apiResult.message


              )
          )
          );
      }
    }catch(e){
      emit(state.copyWith(
          userLoginState: state.userLoginState?.copyWith(
              isLoading: false,
              errMsg: e.toString()
              )
          )
          );

    }

  }
}