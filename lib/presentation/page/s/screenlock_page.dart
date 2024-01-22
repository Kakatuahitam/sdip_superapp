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

class ScreenLockPageSmall extends StatefulWidget {
  const ScreenLockPageSmall({
    Key? key,
    this.seconds
  }) : super(key: key);

  final int? seconds;

  @override
  ScreenLockPageSmallState createState() => ScreenLockPageSmallState();
}

class ScreenLockPageSmallState extends State<ScreenLockPageSmall> with WidgetsBindingObserver {
  AppLifecycleState? _notification;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _notification = state;
    });
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    WidgetsBinding.instance.addObserver(this);
    // startKioskMode();
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    // print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context){
    // if (widget._notification = ) {
    //
    // }

    _showDialog() async {
      await Future.delayed(Duration(milliseconds: 100));


      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AbsorbPointer(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: AlertDialog(
                title: const Text('Sorry'),
                content: Container(
                  width: MediaQuery.of(context).size.width * (40/100),
                  height: MediaQuery.of(context).size.height * (30/100),
                  child: Column(
                    children: [
                      const Text('Your device is still locked. Will be opened at 15.00 WIB'),
                      Countdown(
                        // controlFler: _controller,
                        seconds: widget.seconds ?? 3,
                        build: (_, double time) => Text(
                          time.toString(),
                          style: TextStyle(
                            fontSize: 48,
                          ),
                        ),
                        interval: Duration(milliseconds: 100),
                        onFinished: () {
                          Navigator.pop(context);
                          context.goNamed('home_page');
                        },
                      ),
                      const Text('Your device is still locked. Will be opened at 15.00 WIB')
                    ],
                  )
                ),
                actions: <Widget>[
                  // TextButton(
                  //   child: const Text('Okay'),
                  //   onPressed: () {
                  //     context.goNamed('home_page');
                  //   },
                  // ),
                ],
              ),
            ),
          );
        },
      );
    }

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _showDialog();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 100.0,
          // child: Image.asset('images/icons/pramukauinjkt48px.png', width: 48, height: 48)
        ),
      ),
      drawer: AppDrawerSmall(),
      backgroundColor: Constant.LS_ECRU_WHITE,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Constant.LS_ECRU_WHITE),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
