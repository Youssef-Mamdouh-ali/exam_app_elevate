import 'package:equatable/equatable.dart';
import 'package:exam_app_elevate/configure/base_state/base_state.dart';

class ForgetPasswordState extends Equatable {
  final BaseState<String> sendEmailState;

  const ForgetPasswordState({
    this.sendEmailState = const BaseState<String>(),
  });

  ForgetPasswordState copyWith({BaseState<String>? sendEmailState}) {
    return ForgetPasswordState(
      sendEmailState: sendEmailState ?? this.sendEmailState,
    );
  }

  @override
  List<Object?> get props => [sendEmailState];
}