import 'package:equatable/equatable.dart';
import 'package:exam_app_elevate/configure/base_state/base_state.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';

class LoginState extends Equatable{
  BaseState<AuthEntity>userLoginState;
  final bool rememberMe;
   LoginState({
    this.userLoginState = const BaseState<AuthEntity>(),
    this.rememberMe = false,
  });


  LoginState copyWith({
    BaseState<AuthEntity>? userLoginState,
    bool? rememberMe,
  }){
    return LoginState(
      userLoginState: userLoginState ?? this.userLoginState,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userLoginState, rememberMe];


}