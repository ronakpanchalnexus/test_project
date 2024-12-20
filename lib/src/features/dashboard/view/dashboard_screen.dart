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
import 'package:test_project/core/routes/route_constants.dart';
import 'package:test_project/core/routes/router.dart';
import 'package:test_project/src/shared/double_button_dialog.dart';
import 'package:test_project/src/shared/widget/common_button.dart';
import 'package:test_project/src/shared/widget/common_card_widget.dart';
import 'package:test_project/src/shared/widget/common_textview.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  File? _kProfileImage;
  String _kName = '';
  String _kEmail = '';
  String _kSkills = '';
  String _kWorkExperience = '';

  @override
  void initState() {
    _populateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: CommonTextView(
          text: Strings.appName,
          fontSize: 20,
          color: Colours.primaryColour,
          fontFamily: Fonts.monaSansBold,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.start,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    child: Stack(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(50), // Image radius
                            child: _kProfileImage != null
                                ? Image.file(
                                    _kProfileImage!,
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
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.asset(
                                      MediaRes.icUserPlaceHolder,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: SafeGestureDetector(
                            onTap: () {
                              _gotoEditScreen();
                            },
                            child: SvgPicture.asset(
                              MediaRes.icEdit,
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonCardWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CommonTextView(
                            text: Strings.name,
                            fontSize: 14,
                            color: Colours.textPrimaryColor,
                            fontFamily: Fonts.monaSansMedium,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SafeGestureDetector(
                          onTap: () {
                            _gotoEditScreen();
                          },
                          child: SvgPicture.asset(MediaRes.icPencilBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CommonTextView(
                      text: _kName.isNotEmpty ? _kName : '-',
                      fontSize: 12,
                      color: Colours.textPrimaryColor,
                      fontFamily: Fonts.monaSansRegular,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonTextView(
                            text: Strings.email,
                            fontSize: 14,
                            color: Colours.textPrimaryColor,
                            fontFamily: Fonts.monaSansMedium,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SafeGestureDetector(
                          onTap: () {
                            _gotoEditScreen();
                          },
                          child: SvgPicture.asset(MediaRes.icPencilBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CommonTextView(
                      text: _kEmail.isNotEmpty ? _kEmail : '-',
                      fontSize: 12,
                      color: Colours.textPrimaryColor,
                      fontFamily: Fonts.monaSansRegular,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonTextView(
                            text: Strings.skills,
                            fontSize: 14,
                            color: Colours.textPrimaryColor,
                            fontFamily: Fonts.monaSansMedium,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SafeGestureDetector(
                          onTap: () {
                            _gotoEditScreen();
                          },
                          child: SvgPicture.asset(MediaRes.icPencilBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CommonTextView(
                      text: _kSkills.isNotEmpty ? _kSkills : '-',
                      fontSize: 12,
                      color: Colours.textPrimaryColor,
                      fontFamily: Fonts.monaSansRegular,
                      fontWeight: FontWeight.w400,
                      maxLine: 15,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonTextView(
                            text: Strings.workExperience,
                            fontSize: 14,
                            color: Colours.textPrimaryColor,
                            fontFamily: Fonts.monaSansMedium,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SafeGestureDetector(
                          onTap: () {
                            _gotoEditScreen();
                          },
                          child: SvgPicture.asset(MediaRes.icPencilBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CommonTextView(
                      text:
                          _kWorkExperience.isNotEmpty ? _kWorkExperience : '-',
                      fontSize: 12,
                      color: Colours.textPrimaryColor,
                      fontFamily: Fonts.monaSansRegular,
                      fontWeight: FontWeight.w400,
                      maxLine: 15,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonButton(
                text: 'Log out',
                onTap: () {
                  DoubleButtonDialog.showDoubleButtonDialog(
                    context,
                    title: Strings.logOut,
                    message: Strings.logoutMessage,
                    positiveButton: Strings.yes,
                    negativeButton: Strings.no,
                    callback: (p0) {
                      Prefs.setBool(key: Constants.isLogin, value: false);
                      navigateTo(
                        context: context,
                        route: RouteConstants.login,
                        finish: true,
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoEditScreen() {
    navigateTo(
      context: context,
      route: RouteConstants.editProfile,
      then: (p0) {
        _populateData();
      },
    );
  }

  void _populateData() {
    setState(() {
      _kProfileImage = Prefs.getString(key: Constants.profilePicture).isNotEmpty
          ? File(Prefs.getString(key: Constants.profilePicture))
          : null;
      _kName = Prefs.getString(key: Constants.name);
      _kEmail = Prefs.getString(key: Constants.email);
      _kSkills = Prefs.getString(key: Constants.skills);
      _kWorkExperience = Prefs.getString(key: Constants.workExperience);
    });
  }
}
