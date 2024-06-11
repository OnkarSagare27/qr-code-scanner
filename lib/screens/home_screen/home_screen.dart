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
  void showCustomDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Custom Dialog'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: message));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copied to clipboard!'),
                  ),
                );
              },
              child: const Text('Copy to Clipboard'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
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
                    width: 295,
                    height: 275,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: MobileScanner(
                        onDetect: (barcodes) => {
                          showCustomDialog(context,
                              barcodes.barcodes.first.rawValue ?? "---")
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
