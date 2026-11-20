sealed class LoginEvents {}

class UserLoginEvent extends LoginEvents{
  final String email;
  final String password;

  UserLoginEvent(this.email, this.password);

}