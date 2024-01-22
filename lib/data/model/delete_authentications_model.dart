import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:pramukajaksel_or_id_fe/domain/entity/delete_authentications_response.dart';

class DeleteAuthenticationsModel extends Equatable {
  const DeleteAuthenticationsModel({
    required this.status,
  });

  final String status;

  factory DeleteAuthenticationsModel.fromRawJson(String str) =>
    DeleteAuthenticationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteAuthenticationsModel.fromJson(Map<String, dynamic> json) =>
    DeleteAuthenticationsModel(
      status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };

  DeleteAuthenticationsResponse toEntity() => DeleteAuthenticationsResponse(
    status: status,
  );

  factory DeleteAuthenticationsModel.fromEntity(DeleteAuthenticationsResponse deleteAuthenticationsResponse) =>
    DeleteAuthenticationsModel(
      status: deleteAuthenticationsResponse.status,
    );

  @override
  List<Object?> get props => [status];
}
