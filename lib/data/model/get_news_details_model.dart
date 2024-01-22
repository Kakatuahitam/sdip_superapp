import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:pramukajaksel_or_id_fe/domain/entity/get_news_details_response.dart';

class GetNewsDetailsModel extends Equatable {
  const GetNewsDetailsModel({
    required this.status,
    this.data,
  });

  final String status;
  final dynamic? data;

  @override
  List<Object?> get props => [status, data];

  factory GetNewsDetailsModel.fromRawJson(String str) =>
    GetNewsDetailsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetNewsDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetNewsDetailsModel(
        status: json["status"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
      "status": status,
      "data": data,
    };

    GetNewsDetailsResponse toEntity() => GetNewsDetailsResponse(
      status: status,
      data: data,
    );

    factory GetNewsDetailsModel.fromEntity(GetNewsDetailsResponse getNewsDetailsResponse) =>
      GetNewsDetailsModel(
        status: getNewsDetailsResponse.status,
        data: getNewsDetailsResponse.data,
      );
}
