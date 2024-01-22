import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:pramukajaksel_or_id_fe/domain/entity/post_news_details_response.dart';

class PostNewsDetailsModel extends Equatable {
  const PostNewsDetailsModel({
    required this.status,
    this.data,
  });

  final String status;
  final dynamic? data;

  @override
  List<Object?> get props => [status, data];

  factory PostNewsDetailsModel.fromRawJson(String str) =>
    PostNewsDetailsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PostNewsDetailsModel.fromJson(Map<String, dynamic> json) =>
      PostNewsDetailsModel(
        status: json["status"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
      "status": status,
      "data": data,
    };

    PostNewsDetailsResponse toEntity() => PostNewsDetailsResponse(
      status: status,
      data: data,
    );

    factory PostNewsDetailsModel.fromEntity(PostNewsDetailsResponse postNewsDetailsResponse) =>
      PostNewsDetailsModel(
        status: postNewsDetailsResponse.status,
        data: postNewsDetailsResponse.data,
      );
}
