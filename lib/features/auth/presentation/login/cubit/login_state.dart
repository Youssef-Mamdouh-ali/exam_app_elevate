import 'package:equatable/equatable.dart';
import 'package:exam_app_elevate/configure/base_state/base_state.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';

class LoginState extends Equatable{
  final BaseState<AuthEntity>userLoginState;

   const LoginState({
    this.userLoginState = const BaseState<AuthEntity>(),

  });


  LoginState copyWith({
    BaseState<AuthEntity>? userLoginState,

  }){
    return LoginState(
      userLoginState: userLoginState ?? this.userLoginState,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userLoginState];


}