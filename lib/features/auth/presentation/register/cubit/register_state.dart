import 'package:exam_app_elevate/configure/base_state/base_state.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';

class RegisterState{
  BaseState<AuthEntity>? userRegisterState;

  RegisterState({this.userRegisterState,
   }){

    userRegisterState = userRegisterState ?? BaseState<AuthEntity>(
    );
  }

  RegisterState copyWith({
    BaseState<AuthEntity>? userRegisterState,
  }){
    return RegisterState(
      userRegisterState: userRegisterState ?? this.userRegisterState,
    );
  }

}