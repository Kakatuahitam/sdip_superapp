import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:meta_seo/meta_seo.dart';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sdip_superapp/presentation/page/s/error_page.dart';
import 'package:sdip_superapp/presentation/page/s/home_page.dart';
import 'package:sdip_superapp/presentation/page/s/barcode_page.dart';
import 'package:sdip_superapp/presentation/page/s/screenlock_page.dart';
import 'package:sdip_superapp/presentation/page/s/kiosk_page.dart';
import 'package:sdip_superapp/presentation/page/s/barrier_page.dart';
import 'package:sdip_superapp/presentation/page/s/fg_task_page.dart';
import 'package:sdip_superapp/presentation/page/s/screenlocksetting_page.dart';
// import 'package:sdip_superapp/presentation/page/s/lock_page.dart';

GoRouter mainRouter = GoRouter(
  errorBuilder: (context, state) => ErrorPageSmall(),
  routes: [
    GoRoute(
      name: "home_page",
      path: "/",
      builder: (context, state) {
        if (kIsWeb) {
          // MetaSEO meta = MetaSEO();
          //
          // meta.keyValue(key: 'og:url', value: 'https://pramuka.uinjkt.ac.id');
          // meta.keyValue(key: 'og:type', value: 'website');
          // meta.keyValue(key: 'og:title', value: 'Kami Ada Karena Semangat Kami! | Pramuka UIN Jakarta');
          // meta.keyValue(key: 'og:description', value: 'Pramuka UIN Jakarta merupakan salah satu Unit Kegiatan Khusus (UKK) yang berada pada pangkalan UIN Syarif Hidayatullah Jakarta');
          // meta.keyValue(key: 'og:image', value: 'https://drive.google.com/uc?export=view&id=1tHqmA_TvS-jqiL95tgidc2CjLGbjekhe');
          // meta.keyValue(key: 'og:image:type', value: 'image/png');
          // meta.keyValue(key: 'og:image:width', value: '400');
          // meta.keyValue(key: 'og:image:height', value: '400');

          // This is must be server rendered. Find a way to do it only for giving meta tags
        }
        // return const MyHomePage();

        final now = DateTime.now().toUtc();
        final lock_start = DateTime(now.year, now.month, now.day, 08, 00, 00).toUtc();
        final lock_end = DateTime(now.year, now.month, now.day, 08, 16, 18).toUtc();

        final secondsRemaining = lock_end.difference(now);

        var seconds = 0;

        if (secondsRemaining.inSeconds < 0) {
          seconds = 0;
        } else {
          seconds = secondsRemaining.inSeconds;
        }

        print(seconds);
        if (now.isBefore(lock_start) && now.isAfter(lock_end)) {
          print("is not locked");
          return const MyHomePage();
        } else if (now.isAfter(lock_start) && now.isBefore(lock_end)){
          print("is locked");
          return ScreenLockPageSmall(seconds: seconds);
        } else {
          return MyHomePage();
        }
      },
    ),

    GoRoute(
      name: "barcode_page",
      path: "/barcode",
      builder: (context, state) {
        return const BarcodePageSmall();
      },
    ),

    GoRoute(
      name: "kiosk_page",
      path: "/kiosk",
      builder: (context, state) {
        return const KioskPageSmall();
      },
    ),

    GoRoute(
      name: "barrier_page",
      path: "/barrier",
      builder: (context, state) {
        return const BarrierPageSmall();
      },
    ),

    GoRoute(
      name: "fg_task_page",
      path: "/foreground-task",
      builder: (context, state) {
        return const ForegroundTaskPageSmall();
      },
    ),

    GoRoute(
      name: "screenlock_page",
      path: "/screenlock",
      builder: (context, state) {
        return const ScreenLockSettingPageSmall();
      },
    ),
  ],
);
