import 'package:equatable/equatable.dart';
import 'package:exam_app_elevate/configure/base_state/base_state.dart';

class VerifyCodeState extends Equatable {
  final BaseState<bool> verifyState;
  final BaseState<bool> resendState;

  const VerifyCodeState({
    this.verifyState = const BaseState<bool>(),
    this.resendState = const BaseState<bool>(),
  });

  VerifyCodeState copyWith({
    BaseState<bool>? verifyState,
    BaseState<bool>? resendState,
  }) {
    return VerifyCodeState(
      verifyState: verifyState ?? this.verifyState,
      resendState: resendState ?? this.resendState,
    );
  }

  @override
  List<Object?> get props => [verifyState, resendState];
}