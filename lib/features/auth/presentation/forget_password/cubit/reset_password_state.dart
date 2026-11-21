import 'package:equatable/equatable.dart';
import 'package:exam_app_elevate/configure/base_state/base_state.dart';

class ResetPasswordState extends Equatable {
  final BaseState<bool> resetState;

  const ResetPasswordState({this.resetState = const BaseState<bool>()});

  ResetPasswordState copyWith({BaseState<bool>? resetState}) {
    return ResetPasswordState(resetState: resetState ?? this.resetState);
  }

  @override
  List<Object?> get props => [resetState];
}
