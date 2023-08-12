import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherNotesWidget extends StatelessWidget {
  const OtherNotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: Stack(
        children: [
          Positioned(
            left: 6.w,
            child: Text(
              "Other NOTES",
              style: TextStyle(
                fontFamily: "Metropolis",
                fontSize: 16.sp,
                color: const Color(0XFF1D1E24),
              ),
            ),
          ),
          Positioned(
            left: 132.w,
            top: 13.h,
            child: Container(
              width: 250.w,
              height: 1.h,
              decoration: const BoxDecoration(
                color: Color(0XFF1D1E24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}