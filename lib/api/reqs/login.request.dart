import 'package:json_annotation/json_annotation.dart';

part 'login.request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String username;
  final String password;

  LoginRequest(this.username, this.password);

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson();

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
