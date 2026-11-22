import 'package:exam_app_elevate/features/auth/data/models/user_response_model.dart';
import 'package:exam_app_elevate/features/auth/domain/entities/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResponseModel {
  final String? message;
  final String? token;
  final UserModel? user;

  AuthResponseModel({this.message, this.token, this.user});

  AuthEntity toEntity() {
    return AuthEntity(
      token: token,
      user: user?.toEntity(),
    );
  }

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

