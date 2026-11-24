import 'package:exam_app_elevate/features/auth/data/models/register_request_model.dart';

sealed class RegisterEvents {}


class UserRegisterEvent extends RegisterEvents{
  RegisterRequestModel model;
  UserRegisterEvent(this.model);

}