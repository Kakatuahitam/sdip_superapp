import 'package:pramukajaksel_or_id_fe/data/service/api_service.dart';
import 'package:pramukajaksel_or_id_fe/data/model/get_home_stat_model.dart';

abstract class StatRemoteDataSource {
  Future<GetHomeStatModel> getHomeStat();
}

class StatRemoteDataSourceImp implements StatRemoteDataSource {
  final ApiService apiService;

  StatRemoteDataSourceImp(
    this.apiService,
  );

  @override
  Future<GetHomeStatModel> getHomeStat() async {
    final response = await apiService.getHomeStat();
    return response;
  }
}
