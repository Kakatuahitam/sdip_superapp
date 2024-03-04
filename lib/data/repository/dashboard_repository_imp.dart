import 'dart:io';
import 'package:dartz/dartz.dart';

import 'package:sdip_superapp/data/helper/failure_exception.dart';
import 'package:sdip_superapp/data/source/dashboard_remote_data_source.dart';
import 'package:sdip_superapp/domain/repository/dashboard_repository.dart';
import 'package:sdip_superapp/domain/entity/get_students_list_response.dart';

class DashboardRepositoryImp extends DashboardRepository {
  final DashboardRemoteDataSource remote;

  DashboardRepositoryImp({
    required this.remote,
  });

  @override
  Future<Either<FailureException, GetStudentsListResponse>> getStudentsList() async {
    try {
      final result = await remote.getStudentsList();

      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No internet connection'));
    } catch (e) {
      return Left(FailureException(e.toString()));
    }
  }
}
