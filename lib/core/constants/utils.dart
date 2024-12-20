import 'package:flutter/material.dart';
import 'package:test_project/core/constants/colours.dart';
import 'package:test_project/core/constants/fonts.dart';
import 'package:test_project/src/shared/widget/common_textview.dart';

class Utils {
  static void log(String message) {
    debugPrint(message);
  }

  static void showSnackBar(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colours.primaryColour,
        content: CommonTextView(
          text: message,
          fontSize: 16.0,
          color: Colours.colorWhite,
          fontFamily: Fonts.monaSansMedium,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
