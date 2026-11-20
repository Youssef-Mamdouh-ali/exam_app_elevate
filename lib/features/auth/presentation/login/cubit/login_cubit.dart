import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/user_entity.dart';
import 'package:exam_app_elevate/features/auth/domain/use_cases/login_use_case.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_events.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState>{
  LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase): super(LoginState());

  void doEvent(LoginEvents event){
    switch(event){
      case UserLoginEvent():
        login(event.email, event.password);
        break;
    }
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(
        userLoginState: state.userLoginState?.copyWith(
            isLoading: true
        )
    )
    );

    BaseResponse<List<UserEntity>> apiResult = await _loginUseCase.login(email, password);
    switch (apiResult) {

      case SuccessBaseResponse<List<UserEntity>>():
        emit(state.copyWith(
            userLoginState: state.userLoginState?.copyWith(
                isLoading: false,
                data: apiResult.data

            )
        )
        );
      case ErrorBaseResponse<List<UserEntity>>():
        emit(state.copyWith(
            userLoginState: state.userLoginState?.copyWith(
                isLoading: false,
                errMsg: apiResult.message


            )
        )
        );
    }
  }
}