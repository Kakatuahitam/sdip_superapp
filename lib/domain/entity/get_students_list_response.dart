import 'package:equatable/equatable.dart';

class GetStudentsListResponse extends Equatable {
  const GetStudentsListResponse({
    required this.status,
    this.data,
  });

  final String status;
  final dynamic? data;

  @override
  List<Object?> get props => [status, data];
}
