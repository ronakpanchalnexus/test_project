import 'package:test_project/core/constants/strings.dart';
import 'package:test_project/core/constants/utils.dart';

class ValidationHelper {
  static bool emailValidator(
    context,
    String email,
  ) {
    if (email.isEmpty) {
      Utils.showSnackBar(context, Strings.emailValidation);
      return false;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      Utils.showSnackBar(context, Strings.validEmailValidation);
      return false;
    } else {
      return true;
    }
  }

  static bool passwordValidator(
    context,
    String password,
  ) {
    if (password.isEmpty) {
      Utils.showSnackBar(context, Strings.passwordValidation);
      return false;
    } else if (password.length < 8) {
      Utils.showSnackBar(context, Strings.validPasswordValidation);
      return false;
    } else {
      return true;
    }
  }

  static bool nameValidator(
    context,
    String name,
  ) {
    if (name.isEmpty) {
      Utils.showSnackBar(context, Strings.nameValidation);
      return false;
    } else {
      return true;
    }
  }

  static bool pictureValidator(
    context,
    String picture,
  ) {
    if (picture.isEmpty) {
      Utils.showSnackBar(context, Strings.pictureValidation);
      return false;
    } else {
      return true;
    }
  }

  static bool skillsValidator(
    context,
    String skills,
  ) {
    if (skills.isEmpty) {
      Utils.showSnackBar(context, Strings.skillsValidation);
      return false;
    } else {
      return true;
    }
  }

  static bool workExperienceValidator(
    context,
    String workExperience,
  ) {
    if (workExperience.isEmpty) {
      Utils.showSnackBar(context, Strings.workExperienceValidation);
      return false;
    } else {
      return true;
    }
  }
}
