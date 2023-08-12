import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key, required this.icons, required this.title,
  required this.onTap,});
  final IconData icons;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Row(
        children: [
          Icon(
           icons,
            size: 18.r,
          ),
          SizedBox(
            width: 15.8.w,
          ),
          Text(title,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }
}
