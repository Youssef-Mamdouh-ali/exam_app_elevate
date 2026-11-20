import 'package:exam_app_elevate/configure/base_state/base_state.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/user_entity.dart';

class LoginState {
  BaseState<List<UserEntity>>? userLoginState;

  LoginState({this.userLoginState}){
   userLoginState = userLoginState ?? BaseState<List<UserEntity>>(
     isLoading: false,
     errMsg:null,
     data: [],
   );
  }

  LoginState copyWith({BaseState<List<UserEntity>>? userLoginState}){
    return LoginState(
      userLoginState: userLoginState ?? this.userLoginState,
    );
  }


}