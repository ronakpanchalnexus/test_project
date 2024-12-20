import 'dart:io';

import 'package:test_project/core/constants/colours.dart';
import 'package:test_project/core/constants/fonts.dart';
import 'package:test_project/core/constants/strings.dart';
import 'package:test_project/core/constants/utils.dart';
import 'package:test_project/src/shared/widget/common_button.dart';
import 'package:test_project/src/shared/widget/common_textview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageWidget {
  void selectFromGallery(
    context,
    Function(String, List<File>) callback, {
    bool selectMultiple = false,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Colours.colorWhite,
          backgroundColor: Colours.colorWhite,
          scrollable: true,
          alignment: Alignment.center,
          insetPadding: EdgeInsets.all(10.0),
          contentPadding: EdgeInsets.all(20.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextView(
                    text: Strings.selectImage,
                    fontSize: 20.0,
                    color: Colours.colorBlack,
                    fontFamily: Fonts.monaSansSemiBold,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CommonButton(
                    text: Strings.camera,
                    onTap: () async {
                      File? file = await _getFileFromCamera();
                      callback(file?.path ?? '', []);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CommonButton(
                    text: Strings.gallery,
                    onTap: () async {
                      if (selectMultiple) {
                        List<File>? files = await _getFilesFromGallery();
                        callback('', files ?? []);
                      } else {
                        File? file = await _getFileFromGallery();
                        callback(file?.path ?? '', []);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<File?> _getFileFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      return File(image.path);
    } on PlatformException catch (e) {
      Utils.log('Failed to pick image: $e');
      return null;
    }
  }

  Future<List<File>?> _getFilesFromGallery() async {
    try {
      final imageList = await ImagePicker().pickMultiImage();
      if (imageList.isEmpty) return null;
      List<File> fileList = [];
      for (var element in imageList) {
        fileList.add(File(element.path));
      }
      return fileList;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
      return null;
    }
  }

  Future<File?> _getFileFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return null;
      return File(image.path);
    } on PlatformException catch (e) {
      Utils.log('Failed to pick image: $e');
      return null;
    }
  }
}
