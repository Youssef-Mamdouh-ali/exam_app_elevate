import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/configure/base_state/base_state.dart';
import 'package:exam_app_elevate/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:exam_app_elevate/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'verify_code_event.dart';
import 'verify_code_state.dart';

@injectable
class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final VerifyResetCodeUseCase _verifyUseCase;
  final ForgotPasswordUseCase _forgotUseCase;

  VerifyCodeCubit(this._verifyUseCase, this._forgotUseCase)
      : super(const VerifyCodeState());

  void doEvent(VerifyCodeEvent event) {
    switch (event) {
      case VerifyCodeSubmitEvent():
        _verify(event.code);
      case ResendCodeEvent():
        _resend(event.email);
    }
  }

  Future<void> _verify(String code) async {
    emit(
      state.copyWith(verifyState: const BaseState<bool>(isLoading: true)),
    );

    final result = await _verifyUseCase(code);

    switch (result) {
      case SuccessBaseResponse():
        emit(
          state.copyWith(
            verifyState: const BaseState<bool>(isLoading: false, data: true),
          ),
        );
      case ErrorBaseResponse():
        emit(
          state.copyWith(
            verifyState: BaseState<bool>(
              isLoading: false,
              errMsg: result.message,
            ),
          ),
        );
    }
  }

  Future<void> _resend(String email) async {
    emit(
      state.copyWith(resendState: const BaseState<bool>(isLoading: true)),
    );

    final result = await _forgotUseCase(email);

    switch (result) {
      case SuccessBaseResponse():
        emit(
          state.copyWith(
            resendState: const BaseState<bool>(isLoading: false, data: true),
          ),
        );
      case ErrorBaseResponse():
        emit(
          state.copyWith(
            resendState: BaseState<bool>(
              isLoading: false,
              errMsg: result.message,
            ),
          ),
        );
    }
  }
}