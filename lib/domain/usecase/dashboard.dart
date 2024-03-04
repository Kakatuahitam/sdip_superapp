import 'package:dartz/dartz.dart';

import 'package:sdip_superapp/data/helper/failure_exception.dart';
import 'package:sdip_superapp/domain/repository/dashboard_repository.dart';

class DashboardUseCase {
  final DashboardRepository dashboardRepository;

  DashboardUseCase(this.dashboardRepository);

  Future<Either<FailureException, dynamic>> getStudentsList() async {
    final result = await dashboardRepository.getStudentsList();

    result.fold(
      (failure) {
        return FailureException(failure.toString() + "dashboardRepository.getStudentsList");
      },
      (response) {}
    );

    return result;
  }
}
