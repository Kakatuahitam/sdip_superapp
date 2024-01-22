import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'package:sdip_superapp/data/helper/failure_exception.dart';
// import 'package:sdip_superapp/domain/usecase/stat.dart';

part 'screenlock_state.dart';

// @pragma('vm:entry-point')
// void printHello() {
//   final DateTime now = DateTime.now();
//   final int isolateId = Isolate.current.hashCode;
//   print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
// }

// class ScreenLockCubit extends Cubit<ScreenLockState> {
//   ScreenLockCubit() : super(DisabledState());
//
//   // final int helloAlarmID = 0;
//   // await AndroidAlarmManager.periodic(const Duration(seconds: 30), helloAlarmID, printHello);
//
//   // TODO:
//   // Create a way to call and manage android alarm manager from cubit (possibly
//   // need sharedpref/secure storage)
// }

class IsScreenLockEnabled extends Cubit<bool> {
  IsScreenLockEnabled() : super(false);

  void enableScreenLock() {
    emit(true);
  }

  void disableScreenLock() {
    emit(false);
  }

  // bool checkScreenlockStatus() {
  //   return
  // }
}
