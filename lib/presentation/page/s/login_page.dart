import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sdip_superapp/common/styles.dart';
import 'package:sdip_superapp/common/constants.dart';
import 'package:sdip_superapp/common/utils.dart';

import 'package:sdip_superapp/presentation/widget/s/app_drawer.dart';
import 'package:sdip_superapp/presentation/form/s/login_form.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'package:meta_seo/meta_seo.dart';

class LoginPageSmall extends StatefulWidget {
  static String route = "/";
  const LoginPageSmall({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPageSmall> createState() => _LoginPageSmallState();
}

class _LoginPageSmallState extends State<LoginPageSmall> {
  // put it here so it can be recreated
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerSmall(),
      backgroundColor: Constant.LS_ECRU_WHITE,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Constant.DS_PURPLE),
                  ),
                ),

                child: Align(
                  alignment: Alignment.center,
                  child: Text('Welcome to SDIP Superapp!', style: ThemeText.heading_1_p),
                ),
              ),
              LoginForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Constant.DS_PURPLE),
                      padding: const EdgeInsets.all(8),
                      child: Text('© Tim IT SD Islam Pembangunan 2024',
                        style: ThemeText.standardMiniW,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    // Center(
    //   child: Container(
    //     decoration: BoxDecoration(
    //       border: Border(
    //         bottom: BorderSide(width: 1.0, color: Constant.DS_PURPLE),
    //       ),
    //     ),
    //     child: Center(
    //       child: Text('Selamat Datang', style: ThemeText.heading_1_p),
    //     ),
    //   ),
    // ),
    //
    // LoginForm(),
  }
}
