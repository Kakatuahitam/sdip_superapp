import 'dart:isolate';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sdip_superapp/common/styles.dart';
import 'package:sdip_superapp/common/constants.dart';
import 'package:sdip_superapp/presentation/bloc/screenlock/screenlock_cubit.dart';

import 'package:sdip_superapp/presentation/widget/s/app_drawer.dart';

class ScreenLockSettingPageSmall extends StatefulWidget {
  const ScreenLockSettingPageSmall({Key? key}) : super(key: key);

  @override
  ScreenLockSettingPageSmallState createState() => ScreenLockSettingPageSmallState();
}

final AlarmValue alarm = AlarmValue();
final storage = new FlutterSecureStorage();

class ScreenLockSettingPageSmallState extends State<ScreenLockSettingPageSmall> {
  @override
  void initState() {
    super.initState();
    // _showDialog();
  }

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 100));

    showDialog<void>(
      context: context,
      builder: (context) {
        final state = context.read<IsScreenLockEnabled>().state;

        if (state == true) {
          return ScreenLock(
            correctString: '1234',
            onCancelled: Navigator.of(context).pop,
            onUnlocked: Navigator.of(context).pop,
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  @pragma('vm:entry-point')
  static void printHello() {
    final int isolateId = Isolate.current.hashCode;

    alarm.enableAlarm();
    String datetime = DateTime.now().toString();
    print("Hello " + datetime);
  }

  @override
  Widget build(BuildContext context){
    final int helloAlarmID = 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 100.0,
        ),
      ),
      drawer: AppDrawerSmall(),
      backgroundColor: Constant.LS_ECRU_WHITE,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocListener<IsScreenLockEnabled, bool>(
              // bloc: blocA,
              listener: (context, state) {
                // do stuff here based on BlocA's state
                if (state == true) {
                  _showDialog();
                }
              },
              child: SizedBox.shrink(),
            ),
            ElevatedButton(
              onPressed: () => showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Sorry'),
                    content: const Text('Your device is still locked. Will be opened at 15.00 WIB'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Okay'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                  // return ScreenLock(
                  //   correctString: '1234',
                  //   onCancelled: Navigator.of(context).pop,
                  //   onUnlocked: Navigator.of(context).pop,
                  // );

                  // return Container(
                  //   padding: const EdgeInsets.all(16),
                  //   height: 40.0,
                  //   width: 200.0,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.of(context, rootNavigator: true).pop();
                  //     },
                  //     child: const Text('Test'),
                  //   ),
                  // );

                  // return SizedBox(
                  //   width: 400.0,
                  //   height: 40.0,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.of(context, rootNavigator: true).pop();
                  //     },
                  //     child: const Text('ads'),
                  //   ),
                  // );
                },
              ),
              child: const Text('Do screenlock'),
            ),
            ElevatedButton(
              onPressed: () {
                // alarm.enableAlarm();
                context.read<IsScreenLockEnabled>().enableScreenLock();
              },
              child: const Text('Enable Screenlock'),
            ),

            ElevatedButton(
              onPressed: () {
                // alarm.enableAlarm();
                context.read<IsScreenLockEnabled>().disableScreenLock();
              },
              child: const Text('Disable Screenlock'),
            ),

            ElevatedButton(
              onPressed: () {
                // alarm.enableAlarm();
                context.goNamed('home_page');
              },
              child: const Text('Go To Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmValue {
  final ValueNotifier<bool> isEnabled = ValueNotifier<bool>(false);

  void toggleAlarm() {
    isEnabled.value = !isEnabled.value;
  }

  void enableAlarm() {
    isEnabled.value = true;
  }

  void disableAlarm() {
    isEnabled.value = false;
  }
}
