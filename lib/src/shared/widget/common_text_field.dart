import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/core/constants/colours.dart';
import 'package:test_project/core/constants/fonts.dart';
import 'package:test_project/core/constants/media_res.dart';
import 'package:test_project/core/helper/safe_gesture_detector.dart';
import 'package:test_project/src/shared/widget/common_textview.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    this.controller,
    required this.hint,
    required this.textInputAction,
    required this.inputType,
    this.onTextChanged,
    this.isPassword = false,
    this.focusNode,
    this.leading,
    this.suffix,
    this.maxLength,
    this.showPassword = false,
    this.onPasswordTap,
    this.showDecoration = true,
    this.readOnly = false,
    this.errorText,
    this.onEditingComplete,
    this.minLines = 1,
    this.maxLines = 1,
    this.textColor,
    this.hintTextColor,
    this.textSize,
    this.height,
    this.fontFamily,
    this.fontWeight,
    this.padding,
    this.isOutlined = true,
  });

  final String hint;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType inputType;
  final Function(String)? onTextChanged;
  final bool isPassword;
  final bool showPassword;
  final bool showDecoration;
  final FocusNode? focusNode;
  final Widget? leading;
  final Widget? suffix;
  final int? maxLength;
  final Function()? onPasswordTap;
  final bool readOnly;
  final String? errorText;
  final Function()? onEditingComplete;
  final int minLines;
  final int maxLines;
  final Color? textColor;
  final Color? hintTextColor;
  final double? textSize;
  final double? height;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: minLines == 1 ? height ?? 56.0 : null,
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
          decoration: errorText == null
              ? showDecoration
                  ? isOutlined
                      ? BoxDecoration(
                          color: Colours.colorWhite,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Colours.colorE7E9EF),
                        )
                      : BoxDecoration(
                          color: Colours.colorF8F9FA,
                          borderRadius: BorderRadius.circular(16.0),
                        )
                  : null
              : BoxDecoration(
                  color: Colours.colorF8F9FA,
                  border: Border.all(
                    color: Colors.red,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leading ?? SizedBox.shrink(),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextFormField(
                  minLines: minLines,
                  readOnly: readOnly,
                  focusNode: focusNode,
                  controller: controller,
                  maxLines: maxLines,
                  maxLength: maxLength,
                  onChanged: onTextChanged,
                  textInputAction: textInputAction,
                  keyboardType: inputType,
                  obscureText: isPassword && !showPassword,
                  obscuringCharacter: '⁕',
                  textCapitalization:
                      isPassword || inputType == TextInputType.emailAddress
                          ? TextCapitalization.none
                          : TextCapitalization.sentences,
                  inputFormatters: inputType ==
                          TextInputType.numberWithOptions(decimal: true)
                      ? [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d*'),
                          ),
                        ]
                      : [],
                  style: TextStyle(
                    color: textColor ?? Colours.textPrimaryColor,
                    fontSize: textSize ?? 14.0.sp,
                    fontFamily: fontFamily ?? Fonts.monaSansRegular,
                    fontWeight: fontWeight ?? FontWeight.w400,
                  ),
                  onEditingComplete: onEditingComplete,
                  decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: hintTextColor ?? Colours.hintTextColor,
                      fontSize: 14.0.sp,
                      fontFamily: Fonts.monaSansMedium,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              suffix ?? SizedBox.shrink(),
              if (isPassword)
                SafeGestureDetector(
                  onTap: onPasswordTap!,
                  child: showPassword
                      ? SvgPicture.asset(MediaRes.icShowPassword)
                      : SvgPicture.asset(MediaRes.icHidePassword),
                ),
            ],
          ),
        ),
        if (errorText != null)
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 3.0),
            child: CommonTextView(
              text: errorText!,
              fontSize: 10.0,
              color: Colors.red,
              fontFamily: Fonts.monaSansRegular,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
