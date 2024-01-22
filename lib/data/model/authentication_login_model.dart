import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:pramukajaksel_or_id_fe/domain/entity/authentication_login_response.dart';

class AuthenticationLoginModel extends Equatable {
  const AuthenticationLoginModel({
    required this.status,
    this.accessToken,
    this.refreshToken,
    this.message,
  });

  final String status;
  final String? accessToken;
  final String? refreshToken;
  final String? message;

  factory AuthenticationLoginModel.fromRawJson(String str) =>
    AuthenticationLoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthenticationLoginModel.fromJson(Map<String, dynamic> json) =>
    AuthenticationLoginModel(
      status: json["status"],
      // kenapa ini? TODO
      // ga kenapa2, kalo salah password aja dia g bisa akses data accessToken. 
      accessToken: json["data"]["accessToken"],
      refreshToken: json["data"]["refreshToken"],
      message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "message": message,
  };

  AuthenticationLoginResponse toEntity() => AuthenticationLoginResponse(
    status: status,
    accessToken: accessToken,
    refreshToken: refreshToken,
    message: message,
  );

  factory AuthenticationLoginModel.fromEntity(AuthenticationLoginResponse authenticationLoginResponse) =>
    AuthenticationLoginModel(
      status: authenticationLoginResponse.status,
      accessToken: authenticationLoginResponse.accessToken,
      refreshToken: authenticationLoginResponse.refreshToken,
      message: authenticationLoginResponse.message,
    );

  @override
  List<Object?> get props => [status, accessToken, refreshToken, message];
}
