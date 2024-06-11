import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// A custom overlay for the scanner
class CorneredContainer extends StatelessWidget {
  const CorneredContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 295.w,
          height: 292.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(),
        ),

        // Top left corner
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 47,
            height: 47,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 5,
                  color: Color(0xff3D3D3E),
                ),
                left: BorderSide(
                  width: 5,
                  color: Color(0xff3D3D3E),
                ),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
              ),
            ),
          ),
        ),

        // Top right corner
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 47,
            height: 47,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 5,
                  color: Color(0xff3D3D3E),
                ),
                right: BorderSide(
                  width: 5,
                  color: Color(0xff3D3D3E),
                ),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),

        // Bottom left corner
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 47,
            height: 47,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 5,
                  color: Color(0xff3D3D3E),
                ),
                left: BorderSide(
                  width: 5,
                  color: Color(0xff3D3D3E),
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
          ),
        ),

        // Bottom right corner
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 47,
            height: 47,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 5,
                  color: Color(0xff3D3D3E),
                ),
                right: BorderSide(
                  width: 5,
                  color: Color(0xff3D3D3E),
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
