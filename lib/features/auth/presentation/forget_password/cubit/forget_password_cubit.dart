import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/configure/base_state/base_state.dart';
import 'package:exam_app_elevate/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'forget_password_events.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgetPasswordCubit(this._forgotPasswordUseCase)
    : super(const ForgetPasswordState());

  void doEvent(ForgetPasswordEvent event) {
    switch (event) {
      case SendEmailEvent():
        _sendEmail(event.email);
    }
  }

  Future<void> _sendEmail(String email) async {
    emit(
      state.copyWith(sendEmailState: const BaseState<String>(isLoading: true)),
    );

    final result = await _forgotPasswordUseCase(email);

    switch (result) {
      case SuccessBaseResponse():
        emit(
          state.copyWith(
            sendEmailState: BaseState<String>(isLoading: false, data: email),
          ),
        );
      case ErrorBaseResponse():
        emit(
          state.copyWith(
            sendEmailState: BaseState<String>(
              isLoading: false,
              errMsg: result.message,
            ),
          ),
        );
    }
  }
}
