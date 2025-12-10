import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.backgroundColor,
    this.height,
    this.width,
    this.titleStyle,
    this.borderColor,
    this.isText = true,
    this.child,
    this.prefixIcon,
    this.isStart = true,
  });

  final void Function()? onPressed;
  final String buttonTitle;
  final Color? backgroundColor;
  final double? height, width;
  final TextStyle? titleStyle;
  final Color? borderColor;
  final bool isText;
  final Widget? child;
  final Widget? prefixIcon;
  final bool isStart;
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        minimumSize: Size(width ?? ScreenUtil().screenWidth, height ?? 48.h),
        side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
      ),
      onPressed: onPressed,
      child: isText
          ? Row(
        mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            SizedBox(width: 8.w),
          ],
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                buttonTitle.tr(),
                style: titleStyle ?? Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ],
      )
          : child,
    );
  }
}
