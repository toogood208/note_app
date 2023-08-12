import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/ui/views/home_page/home_page_provider.dart';

class PinnedNotesWidget extends StatelessWidget {
  const PinnedNotesWidget({
    super.key,
    required this.homeProvider,
  });

  final HomePageProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Stack(
        children: [
          Positioned(
            left: 6.w,
            bottom: 0,
            child: Text(
              "PINNED NOTES",
              style: TextStyle(
                fontFamily: "Metropolis",
                fontSize: 16.sp,
                color: const Color(0XFF1D1E24),
              ),
            ),
          ),
          Positioned(
            left: 123.w,
            bottom: 6.h,
            child: Container(
              width: 250.w,
              height: 1.h,
              decoration:
                  const BoxDecoration(color: Color(0XFF1D1E24)),
            ),
          ),
          Positioned(
            bottom: 8.h,
            right: 0,
            child: Row(
              children: [
              GestureDetector(
                onTap: homeProvider.navigateToAddNew,
                child: Image.asset("assets/icons/note_pad.png",
                width: 18.w,
                height: 18.h,),
              ),
              
              SizedBox(
                  width: 9.w,
                ),
                Image.asset("assets/icons/grid.png",
              width: 18.w,
              height: 18.h,),
              SizedBox(
                  width: 9.w,
                ),
                Image.asset("assets/icons/drill.png",
              width: 18.w,
              height: 18.h,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}