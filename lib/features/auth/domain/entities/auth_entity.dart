import 'package:equatable/equatable.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/user_entity.dart';

class AuthEntity extends Equatable{
  final String? token;
  final UserEntity? user;

  AuthEntity({
    required this.token,
    required this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [token, user];
}