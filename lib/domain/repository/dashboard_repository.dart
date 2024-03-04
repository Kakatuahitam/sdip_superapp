import 'package:dartz/dartz.dart';
import 'package:sdip_superapp/data/helper/failure_exception.dart';
import 'package:sdip_superapp/domain/entity/get_students_list_response.dart';

abstract class DashboardRepository {
  Future<Either<FailureException, GetStudentsListResponse>> getStudentsList();
}
