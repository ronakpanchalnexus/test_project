import 'package:flutter/material.dart';
import 'package:test_project/core/constants/colours.dart';
import 'package:test_project/core/constants/constants.dart';
import 'package:test_project/core/constants/fonts.dart';
import 'package:test_project/core/constants/strings.dart';
import 'package:test_project/core/constants/utils.dart';
import 'package:test_project/core/helper/prefs.dart';
import 'package:test_project/core/helper/validation.dart';
import 'package:test_project/core/routes/route_constants.dart';
import 'package:test_project/core/routes/router.dart';
import 'package:test_project/src/shared/widget/common_button.dart';
import 'package:test_project/src/shared/widget/common_card_widget.dart';
import 'package:test_project/src/shared/widget/common_text_field.dart';
import 'package:test_project/src/shared/widget/common_textview.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  bool _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    if (Prefs.getBool(key: Constants.rememberMe)) {
      _emailController.text = Prefs.getString(key: Constants.email);
      _passwordController.text = Prefs.getString(key: Constants.password);
      _rememberMe = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.bgColor,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.0,
              ),
              Center(
                child: CommonTextView(
                  text: Strings.welcomeToMyProfile,
                  fontSize: 22,
                  color: Colours.primaryColour,
                  fontFamily: Fonts.monaSansBold,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: CommonTextView(
                  text: Strings.pleaseLoginToContinue,
                  fontSize: 14,
                  color: Colours.primaryColour,
                  fontFamily: Fonts.monaSansSemiBold,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonCardWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      inputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CommonTextView(
                      text: Strings.password,
                      fontSize: 14,
                      color: Colours.textPrimaryColor,
                      fontFamily: Fonts.monaSansMedium,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CommonTextField(
                      controller: _passwordController,
                      hint: Strings.password,
                      textInputAction: TextInputAction.done,
                      inputType: TextInputType.text,
                      isPassword: true,
                      showPassword: _showPassword,
                      onPasswordTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          checkColor: Colours.colorWhite,
                          activeColor: Colours.primaryColour,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = !_rememberMe;
                            });
                          },
                        ),
                        CommonTextView(
                          text: Strings.rememberMe,
                          fontSize: 14,
                          color: Colours.textPrimaryColor,
                          fontFamily: Fonts.monaSansMedium,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonButton(
                text: Strings.login,
                onTap: () {
                  if (ValidationHelper.emailValidator(
                        context,
                        _emailController.text.trim(),
                      ) &&
                      ValidationHelper.passwordValidator(
                        context,
                        _passwordController.text.trim(),
                      )) {
                    if (_emailController.text.trim() ==
                            'ronak.panchal@nexuslinkservices.in' &&
                        _passwordController.text.trim() == 'ronakpanchal') {
                      Prefs.setString(
                          key: Constants.email,
                          value: _emailController.text.trim());
                      Prefs.setString(
                          key: Constants.password,
                          value: _passwordController.text.trim());
                      Prefs.setBool(key: Constants.isLogin, value: true);
                      Prefs.setBool(
                        key: Constants.rememberMe,
                        value: _rememberMe,
                      );
                      navigateTo(
                        context: context,
                        route: RouteConstants.dashboard,
                        finish: true,
                      );
                    } else {
                      Utils.showSnackBar(context, Strings.invalidCredentials);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
