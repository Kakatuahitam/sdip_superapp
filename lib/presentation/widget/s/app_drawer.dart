import 'package:flutter/material.dart';

import 'package:sdip_superapp/common/constants.dart';
import 'package:sdip_superapp/common/styles.dart';

// import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:change_case/change_case.dart';

class AppDrawerSmall extends StatefulWidget {
  const AppDrawerSmall({Key? key}) : super(key: key);

  @override
  State<AppDrawerSmall> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawerSmall> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (BuildContext) => LoginCubit(),
    //   child: Drawer(
    //     child: ListView(
    //       padding: EdgeInsets.zero,
    //       children: [
    //         _Divider(),
    //         _Copyright(),
    //       ],
    //     ),
    //   ),
    // );
    return _Copyright();
  }

  Widget _Empty() {
    return const SizedBox(height: 0);
  }

  Widget _Divider() {
    return const Divider(thickness: 2);
  }

  Widget _Copyright() {
    return ListTile(
      title: Text('© Pusinfo Kwartir Cabang Jakarta Selatan 2023', style: ThemeText.standardMiniP)
    );
  }
}
