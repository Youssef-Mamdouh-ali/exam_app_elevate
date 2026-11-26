import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/features/auth/data/models/register_request_model.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';
import 'package:exam_app_elevate/features/auth/domain/use_cases/register_use_case.dart';
import 'package:exam_app_elevate/features/auth/presentation/register/cubit/register_events.dart';
import 'package:exam_app_elevate/features/auth/presentation/register/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState>{

  final RegisterUseCase _registerUseCase;
  RegisterCubit(this._registerUseCase) : super(RegisterState());

  void doEvent(RegisterEvents event){

    switch(event){

      case UserRegisterEvent():

        _register(event.model);
        break;
    }
  }

  Future<void> _register(RegisterRequestModel model) async{
    emit(state.copyWith(userRegisterState: state.userRegisterState?.copyWith(isLoading: true)));

      final response = await _registerUseCase(model);

      switch(response){
        case SuccessBaseResponse<AuthEntity>():
          emit(state.copyWith(
              userRegisterState: state.userRegisterState?.copyWith(
                  isLoading: false,
                  data: response.data)));

        case ErrorBaseResponse<AuthEntity>():
          emit(state.copyWith(
              userRegisterState: state.userRegisterState?.copyWith(
                  isLoading: false,
                  errMsg: response.message)));
      }


  }

}