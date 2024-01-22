import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'injector.dart' as di;
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

import 'package:sdip_superapp/util/routes/go_router_config.dart';
import 'package:sdip_superapp/common/constants.dart';
import 'package:sdip_superapp/common/utils.dart';

// @pragma('vm:entry-point')
// void printHello() {
//   final DateTime now = DateTime.now();
//   final int isolateId = Isolate.current.hashCode;
//   print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
// }

void main() async {
  if (kReleaseMode) {
    await dotenv.load(fileName: ".env.production");
  } else {
    await dotenv.load(fileName: ".env.development");
  }

  if (kIsWeb) {
    MetaSEO().config();
  }

  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  configureApp();

  await AndroidAlarmManager.initialize();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(const MyApp()));
  // runApp(const MyApp());
  // final int alarmID = 0;
  //
  // final storage = new FlutterSecureStorage();
  // String? alarmSchedule = await storage.read(key: "alarmSchedule");

  // if (alarmSchedule != null) {
  //   // await AndroidAlarmManager.periodic(const Duration(minutes: 1), int.parse(alarmID), printHello);
  //   await AndroidAlarmManager.oneShotAt(
  //     DateTime.parse(alarmSchedule),
  //     alarmID,
  //     printHello
  //   );
  // }
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// state navigation (provider and bloc)
      providers: [
        // BlocProvider(create: (_) => di.getIt<LoginCubit>()),
        // BlocProvider(create: (_) => di.getIt<IsScreenLockEnabled>()),
      ],
      child: MaterialApp.router(
        routerConfig: mainRouter,
        title: 'SD Islam Pembangunan',
        theme: ThemeData(
          primarySwatch: createMaterialColor(Constant.DS_PURPLE),
        ),
      ),
    );
  }
}
