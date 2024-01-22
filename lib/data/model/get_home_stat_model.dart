import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:pramukajaksel_or_id_fe/domain/entity/get_home_stat_response.dart';

// class GetHomeStatResponse extends Equatable {
//   const GetHomeStatReponse({
//     required this.status,
//     this.data,
//   })
//
//   final String status;
//   final dynamic? data;
//
//   @override
//   List<Object?> get props => [status, data];
// }

class GetHomeStatModel extends Equatable {
  const GetHomeStatModel({
    required this.status,
    this.data,
  });

  final String status;
  final dynamic? data;

  @override
  List<Object?> get props => [status, data];

  factory GetHomeStatModel.fromRawJson(String str) =>
    GetHomeStatModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetHomeStatModel.fromJson(Map<String, dynamic> json) =>
      GetHomeStatModel(
        status: json["status"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
      "status": status,
      "data": data,
    };

    GetHomeStatResponse toEntity() => GetHomeStatResponse(
      status: status,
      data: data,
    );

    factory GetHomeStatModel.fromEntity(GetHomeStatResponse getHomeStatResponse) =>
      GetHomeStatModel(
        status: getHomeStatResponse.status,
        data: getHomeStatResponse.data,
      );
}
