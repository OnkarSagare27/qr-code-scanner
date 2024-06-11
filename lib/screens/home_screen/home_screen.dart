import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'widgets/cornered_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isScanned = false;

  void showCustomDialog(BuildContext context, String message) {
    // This dialog box shows the scanned QR code details, it has an option to copy the data of the code to the clipboard.
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Column(
            children: [
              Text(
                message,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: message));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Copied to clipboard!'),
                    ),
                  );
                },
                child: const Text(
                  'Copy to Clipboard',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  isScanned = false;
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1efe5),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 66.64.h,
                ),
              )),
          Expanded(
              flex: 4,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: 295.w,
                    height: 292.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: MobileScanner(
                        onDetect: (barcodes) {
                          if (!isScanned) {
                            // When the QR code is scanned it toggles the value of "isScanned" so that it won't scan the code more than once
                            setState(() {
                              isScanned = true;
                            });

                            // If the rawValue is null it will show "---" as rawValue

                            showCustomDialog(context,
                                barcodes.barcodes.first.rawValue ?? "---");
                          }
                        },
                      ),
                    ),
                  ),
                  const CorneredContainer()
                ],
              )),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 300.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Scannen Sie den QR-Code',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Scannen Sie den QR-Code auf der Unterseite des Gateways, um die Installation fortzusetzen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: const Color(0xff898989),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
