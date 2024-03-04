import 'package:sdip_superapp/data/service/api_service.dart';

import 'package:sdip_superapp/data/model/get_students_list_model.dart';

abstract class DashboardRemoteDataSource {
  Future<GetStudentsListModel> getStudentsList();
}

class DashboardRemoteDataSourceImp implements DashboardRemoteDataSource {
  final ApiService apiService;

  DashboardRemoteDataSourceImp(
    this.apiService,
  );

  @override
  Future<GetStudentsListModel> getStudentsList() async {
    final response = await apiService.getStudentsList();
    return response;
  }
}
