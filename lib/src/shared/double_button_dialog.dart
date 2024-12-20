import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/constants/colours.dart';
import 'package:test_project/core/constants/fonts.dart';
import 'package:test_project/src/shared/widget/common_textview.dart';

class DoubleButtonDialog {
  static void showDoubleButtonDialog(
    context, {
    required String title,
    required String message,
    required String positiveButton,
    required String negativeButton,
    required Function(String) callback,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return CupertinoAlertDialog(
          title: Center(
            child: CommonTextView(
              text: title,
              color: Colours.colorBlack,
              fontSize: 16.0,
              fontFamily: Fonts.monaSansSemiBold,
              fontWeight: FontWeight.w600,
              maxLine: 10,
            ),
          ),
          content: Center(
            child: CommonTextView(
              text: message,
              color: Colours.colorBlack,
              fontSize: 14.0,
              fontFamily: Fonts.monaSansRegular,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              maxLine: 5,
            ),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, false);
              },
              isDefaultAction: false,
              isDestructiveAction: false,
              child: CommonTextView(
                text: negativeButton,
                color: Colors.red,
                fontSize: 14.0,
                fontFamily: Fonts.monaSansRegular,
                fontWeight: FontWeight.w400,
              ),
            ),
            CupertinoDialogAction(
              onPressed: () async {
                callback('success');
                // Navigator.pop(context, true);
              },
              isDefaultAction: true,
              isDestructiveAction: true,
              child: CommonTextView(
                text: positiveButton,
                color: Colours.primaryColour,
                fontSize: 14.0,
                fontFamily: Fonts.monaSansRegular,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      },
    );
  }
}
