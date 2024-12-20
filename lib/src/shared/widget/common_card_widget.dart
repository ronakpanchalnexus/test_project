import 'package:test_project/core/constants/colours.dart';
import 'package:test_project/core/helper/safe_gesture_detector.dart';
import 'package:flutter/material.dart';

class CommonCardWidget extends StatelessWidget {
  const CommonCardWidget({
    super.key,
    required this.child,
    this.borderRadius = 12.0,
    this.elevation = 1.0,
    this.bgColor = Colours.colorWhite,
    this.padding,
    this.width,
    this.height,
    this.onTap,
  });

  final Widget child;
  final double borderRadius;
  final double elevation;
  final double? width;
  final double? height;
  final Color bgColor;
  final Function()? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return onTap != null
        ? SafeGestureDetector(
            onTap: onTap!,
            child: Card(
              elevation: elevation,
              surfaceTintColor: bgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Container(
                padding: padding ?? EdgeInsets.all(20.0),
                width: width ?? double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: child,
              ),
            ),
          )
        : Card(
            elevation: elevation,
            surfaceTintColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Container(
              padding: padding ?? EdgeInsets.all(20.0),
              width: width ?? double.infinity,
              height: height,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: child,
            ),
          );
  }
}
