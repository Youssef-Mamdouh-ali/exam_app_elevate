import 'package:exam_app_elevate/core/constants/app_strings.dart';

class Validators {

  Validators._();

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.invalidEmail;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.invalidPassword;
    }
    if (value.length < 8) {
      return AppStrings.invalidPassword;
    }
    return null;
  }

}