import 'package:exam_app_elevate/configure/base_state/base_state.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';

class LoginState {
  BaseState<AuthEntity>? userLoginState;
  final bool rememberMe;

  LoginState({this.userLoginState,
  this.rememberMe = false,}){

   userLoginState = userLoginState ?? BaseState<AuthEntity>(
     isLoading: false,
     errMsg:null,
     data: null,
   );
  }

  LoginState copyWith({
    BaseState<AuthEntity>? userLoginState,
    bool? rememberMe,
  }){
    return LoginState(
      userLoginState: userLoginState ?? this.userLoginState,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }


}