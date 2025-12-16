import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant_app/colors_app.dart';

class CountWidget extends StatelessWidget {
  final String iconPath;
  final num value;

  const CountWidget({
    super.key,
    required this.iconPath,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorsApp.secondColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(iconPath),
            color: ColorsApp.primaryColor,
            size: 20.sp,
          ),
          SizedBox(width: 6.w),
          Text(
            value.toString(),
            style: TextStyle(
              color: ColorsApp.whiteColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
