import 'package:equatable/equatable.dart';
import 'package:exam_app_elevate/features/auth/data/models/register_request_model.dart';

sealed class RegisterEvents extends Equatable{}


class UserRegisterEvent extends RegisterEvents{
  final RegisterRequestModel model;
  UserRegisterEvent(this.model);

  @override
  // TODO: implement props
  List<Object?> get props => [model];

}