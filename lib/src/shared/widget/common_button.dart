import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/core/constants/colours.dart';
import 'package:test_project/core/constants/fonts.dart';
import 'package:test_project/core/helper/safe_gesture_detector.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.isOutlined = false,
    this.iconSize = 24.0,
    this.icon,
    required this.text,
    this.fontSize = 14.0,
    this.height = 51.0,
    this.borderRadius = 16.0,
    this.color = Colours.colorWhite,
    this.outlinedTextColor = Colours.primaryColour,
    this.outlinedBorderColor = Colours.primaryColour,
    this.fontFamily = Fonts.monaSansMedium,
    this.fontWeight = FontWeight.w500,
    this.bgColor = Colours.primaryColour,
    required this.onTap,
  });

  final double? iconSize;
  final bool isOutlined;
  final String? icon;
  final String text;
  final double fontSize;
  final double height;
  final double borderRadius;
  final Color color;
  final Color outlinedTextColor;
  final Color outlinedBorderColor;
  final Color bgColor;
  final String fontFamily;
  final FontWeight fontWeight;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SafeGestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: isOutlined ? Colours.colorWhite : bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: isOutlined ? Border.all(color: outlinedBorderColor) : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            icon != null
                ? Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      icon!,
                      width: iconSize,
                      height: iconSize,
                    ),
                  )
                : SizedBox.shrink(),
            Text(
              text,
              style: TextStyle(
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                fontSize: fontSize.sp,
                color: isOutlined ? outlinedTextColor : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
