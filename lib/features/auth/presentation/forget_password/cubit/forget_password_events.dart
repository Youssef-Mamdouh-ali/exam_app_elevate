sealed class ForgetPasswordEvent {}

class SendEmailEvent extends ForgetPasswordEvent {
  final String email;

  SendEmailEvent(this.email);
}

