sealed class VerifyCodeEvent {}

class VerifyCodeSubmitEvent extends VerifyCodeEvent {
  final String code;
  VerifyCodeSubmitEvent(this.code);
}

class ResendCodeEvent extends VerifyCodeEvent {
  final String email;
  ResendCodeEvent(this.email);
}