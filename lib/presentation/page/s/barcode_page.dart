import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sdip_superapp/common/styles.dart';
import 'package:sdip_superapp/common/constants.dart';

import 'package:sdip_superapp/presentation/widget/s/app_drawer.dart';

class BarcodePageSmall extends StatelessWidget{
  const BarcodePageSmall({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 100.0,
          // child: Image.asset('images/icons/pramukauinjkt48px.png', width: 48, height: 48)
        ),
      ),
      // drawer: AppDrawerSmall(),
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
                    Padding(
                      padding: const EdgeInsets.all(20),
                      // child: Image.asset('images/rafakacamata.png', height: 120),
                    ),

                    Text('Barcode Page', style: ThemeText.titleP),

                    // MobileScanner(
                    //   // fit: BoxFit.contain,
                    //   controller: MobileScannerController(
                    //     detectionSpeed: DetectionSpeed.normal,
                    //     facing: CameraFacing.front,
                    //     torchEnabled: true,
                    //   ),
                    //   onDetect: (capture) {
                    //     final List<Barcode> barcodes = capture.barcodes;
                    //     final Uint8List? image = capture.image;
                    //     for (final barcode in barcodes) {
                    //       debugPrint('Barcode found! ${barcode.rawValue}');
                    //     }
                    //   },
                    // ),

                    MobileScanner(
                      fit: BoxFit.contain,
                      controller: MobileScannerController(
                        // facing: CameraFacing.back,
                        // torchEnabled: false,
                        returnImage: true,
                      ),
                      onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        final Uint8List? image = capture.image;
                        for (final barcode in barcodes) {
                          debugPrint('Barcode found! ${barcode.rawValue}');
                        }
                        if (image != null) {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                Image(image: MemoryImage(image)),
                          );
                          Future.delayed(const Duration(seconds: 5), () {
                            Navigator.pop(context);
                          });
                        }
                      },
                    ),
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
