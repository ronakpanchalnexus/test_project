import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/core/helper/safe_gesture_detector.dart';

class CommonTextView extends StatelessWidget {
  const CommonTextView({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.fontFamily,
    required this.fontWeight,
    this.padding = 0,
    this.maxLine,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.underLine = false,
  });

  final String text;
  final double fontSize;
  final double padding;
  final Color color;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Function()? onTap;
  final int? maxLine;
  final bool underLine;

  @override
  Widget build(BuildContext context) {
    return onTap != null
        ? SafeGestureDetector(
            onTap: onTap!,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Text(
                text,
                textAlign: textAlign,
                maxLines: maxLine,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontFamily: fontFamily,
                  fontSize: fontSize.sp,
                  color: color,
                  decoration: underLine ? TextDecoration.underline : null,
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              text,
              textAlign: textAlign,
              maxLines: maxLine,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                fontSize: fontSize.sp,
                color: color,
                decoration: underLine ? TextDecoration.underline : null,
              ),
            ),
          );
  }
}
