import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sdip_superapp/presentation/bloc/login/login_cubit.dart';
import 'package:sdip_superapp/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:sdip_superapp/presentation/bloc/dashboard/dashboard_cubit.dart';

import 'package:sdip_superapp/domain/usecase/dashboard.dart';

import 'package:sdip_superapp/domain/repository/dashboard_repository.dart';

import 'package:sdip_superapp/data/repository/dashboard_repository_imp.dart';

import 'package:sdip_superapp/data/source/dashboard_remote_data_source.dart';

import 'package:sdip_superapp/data/service/api_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // IOClient ioClient = await SSLPinning.ioClient;

  // bloc
  getIt.registerFactory<LoginCubit>(() => LoginCubit());
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit(
    dashboardUseCase: getIt(),
  ));

  // usecase
  getIt.registerLazySingleton<DashboardUseCase>(() => DashboardUseCase(
    getIt(),
  ));

  // repository (abstract class)
  getIt.registerLazySingleton<DashboardRepository>(() => DashboardRepositoryImp(
    remote: getIt(),
  ));

  // source (abstract class)
  getIt.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImp(
      getIt(),
  ));

  // secure source

  // service
  getIt.registerLazySingleton<ApiService>(() => ApiService(
    httpClient: getIt(),
  ));

  // external

  // getIt.registerFactory<IOClient>(() => ioClient);
  getIt.registerFactory<http.Client>(() => http.Client());
  getIt.registerFactory<FlutterSecureStorage>(() => FlutterSecureStorage());
}
