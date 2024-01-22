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

class BarrierPageSmall extends StatefulWidget {
  const BarrierPageSmall({
    Key? key,
    this.seconds
  }) : super(key: key);

  final int? seconds;

  @override
  BarrierPageSmallState createState() => BarrierPageSmallState();
}

class BarrierPageSmallState extends State<BarrierPageSmall>{
  @override
  Widget build(BuildContext context){
    return ModalBarrier(
      dismissible: false,
    );
  }
}
