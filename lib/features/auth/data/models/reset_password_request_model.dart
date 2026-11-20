import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_model.g.dart';

@JsonSerializable(createFactory: false)
class ResetPasswordRequestModel {
  final String email;

  final String newPassword;

  ResetPasswordRequestModel({required this.email, required this.newPassword});

  Map<String,dynamic> toJson() => _$ResetPasswordRequestModelToJson(this);
}
