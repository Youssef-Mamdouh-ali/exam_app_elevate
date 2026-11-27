import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/configure/base_state/base_state.dart';
import 'package:exam_app_elevate/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'reset_password_event.dart';
import 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(this._resetPasswordUseCase)
    : super(const ResetPasswordState());

  void doEvent(ResetPasswordEvent event) {
    switch (event) {
      case SubmitResetPasswordEvent():
        _resetPassword(event.email, event.newPassword);
    }
  }

  Future<void> _resetPassword(String email, String newPassword) async {
    emit(state.copyWith(resetState: const BaseState<bool>(isLoading: true)));

    final result = await _resetPasswordUseCase(email, newPassword);

    switch (result) {
      case SuccessBaseResponse():
        emit(
          state.copyWith(
            resetState: const BaseState<bool>(isLoading: false, data: true),
          ),
        );
      case ErrorBaseResponse():
        emit(
          state.copyWith(
            resetState: BaseState<bool>(
              isLoading: false,
              errMsg: result.message,
            ),
          ),
        );
    }
  }


}
