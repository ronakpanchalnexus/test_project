import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/core/constants/colours.dart';
import 'package:test_project/core/constants/constants.dart';
import 'package:test_project/core/constants/fonts.dart';
import 'package:test_project/core/constants/media_res.dart';
import 'package:test_project/core/constants/strings.dart';
import 'package:test_project/core/helper/prefs.dart';
import 'package:test_project/core/helper/safe_gesture_detector.dart';
import 'package:test_project/core/helper/select_image_widget.dart';
import 'package:test_project/core/helper/validation.dart';
import 'package:test_project/src/shared/double_button_dialog.dart';
import 'package:test_project/src/shared/widget/common_button.dart';
import 'package:test_project/src/shared/widget/common_text_field.dart';
import 'package:test_project/src/shared/widget/common_textview.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _kSelectedImage;
  final TextEditingController _nameController = TextEditingController(
    text: Prefs.getString(key: Constants.name),
  );
  final TextEditingController _emailController = TextEditingController(
    text: Prefs.getString(key: Constants.email),
  );
  final TextEditingController _skillsController = TextEditingController(
    text: Prefs.getString(key: Constants.skills),
  );
  final TextEditingController _workExperienceController = TextEditingController(
    text: Prefs.getString(key: Constants.workExperience),
  );

  @override
  void initState() {
    _kSelectedImage = Prefs.getString(key: Constants.profilePicture).isNotEmpty
        ? File(Prefs.getString(key: Constants.profilePicture))
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SafeGestureDetector(
          onTap: () {
            if (_checkIfChangedAnything()) {
              DoubleButtonDialog.showDoubleButtonDialog(
                context,
                title: Strings.alert,
                message: Strings.alertMessage,
                positiveButton: Strings.yes,
                negativeButton: Strings.no,
                callback: (p0) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
            } else {
              Navigator.pop(context);
            }
          },
          child: SvgPicture.asset(MediaRes.icBack),
        ),
        title: CommonTextView(
          text: Strings.appName,
          fontSize: 16,
          color: Colours.primaryColour,
          fontFamily: Fonts.monaSansSemiBold,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.start,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colours.colorABABAB,
                    width: 1.0,
                  ),
                ),
                child: Center(
                  child: _kSelectedImage != null
                      ? Stack(
                          children: [
                            ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(50), // Image radius
                                child: Image.file(
                                  _kSelectedImage!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.asset(
                                        MediaRes.icUserPlaceHolder,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: SafeGestureDetector(
                                onTap: () {
                                  SelectImageWidget().selectFromGallery(
                                    context,
                                    (filepath, files) {
                                      Navigator.pop(context);
                                      if (filepath.isNotEmpty) {
                                        setState(() {
                                          _kSelectedImage = File(filepath);
                                        });
                                      }
                                    },
                                  );
                                },
                                child: SvgPicture.asset(
                                  MediaRes.icEdit,
                                  width: 30.0,
                                  height: 30.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      : CommonTextView(
                          text: Strings.addPhoto,
                          fontSize: 12.0,
                          color: Colours.color9CA2A8,
                          fontFamily: Fonts.monaSansMedium,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          onTap: () async {
                            SelectImageWidget().selectFromGallery(
                              context,
                              (filepath, files) {
                                Navigator.pop(context);
                                if (filepath.isNotEmpty) {
                                  setState(() {
                                    _kSelectedImage = File(filepath);
                                  });
                                }
                              },
                            );
                          },
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            CommonTextView(
              text: Strings.name,
              fontSize: 14,
              color: Colours.textPrimaryColor,
              fontFamily: Fonts.monaSansMedium,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 8.0,
            ),
            CommonTextField(
              controller: _nameController,
              hint: Strings.name,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20.0,
            ),
            CommonTextView(
              text: Strings.email,
              fontSize: 14,
              color: Colours.textPrimaryColor,
              fontFamily: Fonts.monaSansMedium,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 8.0,
            ),
            CommonTextField(
              controller: _emailController,
              hint: Strings.email,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20.0,
            ),
            CommonTextView(
              text: Strings.skills,
              fontSize: 14,
              color: Colours.textPrimaryColor,
              fontFamily: Fonts.monaSansMedium,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 8.0,
            ),
            CommonTextField(
              controller: _skillsController,
              hint: Strings.skills,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20.0,
            ),
            CommonTextView(
              text: Strings.workExperience,
              fontSize: 14,
              color: Colours.textPrimaryColor,
              fontFamily: Fonts.monaSansMedium,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 8.0,
            ),
            CommonTextField(
              controller: _workExperienceController,
              hint: Strings.workExperience,
              textInputAction: TextInputAction.done,
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20.0,
            ),
            CommonButton(
              text: Strings.save,
              onTap: () {
                if (ValidationHelper.emailValidator(
                  context,
                  _emailController.text.trim(),
                )) {
                  Prefs.setString(
                      key: Constants.email,
                      value: _emailController.text.trim());
                  Prefs.setString(
                      key: Constants.name, value: _nameController.text.trim());
                  Prefs.setString(
                      key: Constants.skills,
                      value: _skillsController.text.trim());
                  Prefs.setString(
                      key: Constants.workExperience,
                      value: _workExperienceController.text.trim());
                  Prefs.setString(
                      key: Constants.profilePicture,
                      value: _kSelectedImage?.path ?? '');
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _checkIfChangedAnything() {
    return !(_nameController.text.trim() ==
            Prefs.getString(key: Constants.name) &&
        _emailController.text.trim() == Prefs.getString(key: Constants.email) &&
        _skillsController.text.trim() ==
            Prefs.getString(key: Constants.skills) &&
        _workExperienceController.text.trim() ==
            Prefs.getString(key: Constants.workExperience) &&
        (_kSelectedImage?.path ?? '') ==
            Prefs.getString(key: Constants.profilePicture));
  }
}
