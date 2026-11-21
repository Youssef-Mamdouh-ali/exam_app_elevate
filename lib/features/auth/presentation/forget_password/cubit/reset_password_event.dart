sealed class ResetPasswordEvent {}

class SubmitResetPasswordEvent extends ResetPasswordEvent {
  final String email;
  final String newPassword;

  SubmitResetPasswordEvent({required this.email, required this.newPassword});
}