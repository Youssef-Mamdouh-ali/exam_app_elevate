sealed class LoginEvents {}

class UserLoginEvent extends LoginEvents{
  final String email;
  final String password;
  final bool rememberMe;
  UserLoginEvent(this.email, this.password, {this.rememberMe = false});

}