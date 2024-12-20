import 'package:test_project/core/helper/build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderDialog {
  static AlertDialog? alert;

  static void createDialogInstance() {
    alert = AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [CupertinoActivityIndicator()],
      ),
    );
  }

  static showLoaderDialog({String message = "Loading..."}) {
    alert ??= AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CupertinoActivityIndicator(),
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: mContext,
      builder: (BuildContext context) {
        return Material(
            type: MaterialType.transparency,
            child: PopScope(canPop: false, child: alert!));
      },
    );
  }

  static void dismissDialog() {
    if (alert != null) {
      Navigator.pop(mContext);
    }
  }
}
