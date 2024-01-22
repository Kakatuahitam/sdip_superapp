import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'package:sdip_superapp/common/styles.dart';
import 'package:sdip_superapp/common/constants.dart';
import 'package:sdip_superapp/presentation/widget/s/app_drawer.dart';
import 'package:sdip_superapp/presentation/bloc/screenlock/screenlock_cubit.dart';

class KioskPageSmall extends StatefulWidget {
  const KioskPageSmall({
    Key? key,
    this.seconds
  }) : super(key: key);

  final int? seconds;

  @override
  KioskPageSmallState createState() => KioskPageSmallState();
}

class KioskPageSmallState extends State<KioskPageSmall>{
  late final Stream<KioskMode> _currentMode = watchKioskMode();

  void _showSnackBar(String message) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));

  void _handleStart(bool didStart) {
    if (!didStart && Platform.isIOS) {
      _showSnackBar(
        'Single App mode is supported only for devices that are supervised'
        ' using Mobile Device Management (MDM) and the app itself must'
        ' be enabled for this mode by MDM.',
      );
    }
  }

  void _handleStop(bool? didStop) {
    if (didStop == false) {
      _showSnackBar(
        'Kiosk mode could not be stopped or was not active to begin with.',
      );
    }
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: _currentMode,
    builder: (context, snapshot) {
      final mode = snapshot.data;
      final message = mode == null
        ? 'Can\'t determine the mode'
        : 'Current mode is $mode';

      return WillPopScope(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              onPressed: mode == null || mode == KioskMode.enabled
                ? null
                : () => startKioskMode().then(_handleStart),
              child: Text('Start Kiosk Mode', style: ThemeText.standardFormFieldP),
            ),
            MaterialButton(
              onPressed: mode == null || mode == KioskMode.disabled
                ? null
                : () => stopKioskMode().then(_handleStop),
              child: Text('Stop Kiosk Mode', style: ThemeText.standardFormFieldP),
            ),
            MaterialButton(
              onPressed: () => isManagedKiosk()
                .then((isManaged) => 'Kiosk is managed: $isManaged')
                .then(_showSnackBar),
              child: Text('Check if managed', style: ThemeText.standardFormFieldP),
            ),
            MaterialButton(
              onPressed: () => getKioskMode()
                .then((mode) => 'Kiosk mode: $mode')
                .then(_showSnackBar),
              child: Text('Check mode', style: ThemeText.standardFormFieldP),
            ),
            Text(message),
          ],
        ),

        onWillPop: () async {
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Do you want to go back?'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No'),
                  ),
                ],
              );
            },
          );
          return shouldPop!;
        }
      );
    },
  );
}
