import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sdip_superapp/presentation/bloc/screenlock/screenlock_cubit.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // IOClient ioClient = await SSLPinning.ioClient;

  // bloc
  getIt.registerFactory<IsScreenLockEnabled>(() => IsScreenLockEnabled());

  // usecase

  // repository (abstract class)

  // source (abstract class)

  // secure source

  // service

  // external

  // getIt.registerFactory<IOClient>(() => ioClient);
  getIt.registerFactory<http.Client>(() => http.Client());
  getIt.registerFactory<FlutterSecureStorage>(() => FlutterSecureStorage());
}
