import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:sdip_superapp/domain/entity/get_students_list_response.dart';

class GetStudentsListModel extends Equatable {
  const GetStudentsListModel({
    required this.status,
    this.data,
  });

  final String status;
  final dynamic? data;

  @override
  List<Object?> get props => [status, data];

  factory GetStudentsListModel.fromRawJson(String str) =>
    GetStudentsListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetStudentsListModel.fromJson(Map<String, dynamic> json) =>
      GetStudentsListModel(
        status: json["status"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
      "status": status,
      "data": data,
    };

    GetStudentsListResponse toEntity() => GetStudentsListResponse(
      status: status,
      data: data,
    );

    factory GetStudentsListModel.fromEntity(GetStudentsListResponse getStudentsListResponse) =>
      GetStudentsListModel(
        status: getStudentsListResponse.status,
        data: getStudentsListResponse.data,
      );
}
