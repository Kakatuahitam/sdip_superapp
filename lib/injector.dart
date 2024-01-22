import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

<<<<<<< HEAD
=======
import 'package:sdip_superapp/presentation/bloc/screenlock/screenlock_cubit.dart';

>>>>>>> e322944f2f33536aa644c9dfb1f9d7d30123d9dc
final getIt = GetIt.instance;

Future<void> setup() async {
  // IOClient ioClient = await SSLPinning.ioClient;

  // bloc
<<<<<<< HEAD
=======
  getIt.registerFactory<IsScreenLockEnabled>(() => IsScreenLockEnabled());
>>>>>>> e322944f2f33536aa644c9dfb1f9d7d30123d9dc

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
