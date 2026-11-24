import 'package:equatable/equatable.dart';

sealed class LoginEvents extends Equatable{}

class UserLoginEvent extends LoginEvents{
  final String email;
  final String password;
  final bool rememberMe;
  UserLoginEvent(this.email, this.password, {this.rememberMe = false});

  @override

  List<Object?> get props => [email,password,rememberMe];

}