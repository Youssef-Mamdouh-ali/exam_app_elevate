import 'package:exam_app_elevate/core/constants/app_strings.dart';

class AppValidators {
  AppValidators._();

  static final RegExp _emailRegex = RegExp(
    r'^[\w\.\-+]+@([\w\-]+\.)+[\w\-]{2,}$',
  );


  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.invalidName;
    }
    return null;
  }
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.invalidName;
    }
    return null;
  }
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.invalidPhoneNumber;
    }
    return null;
  }
  static bool isValidEmail(String email) => _emailRegex.hasMatch(email.trim());

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty || !isValidEmail(value)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static final RegExp _passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');

  static bool isValidPassword(String password) =>
      _passwordRegex.hasMatch(password);

  static String? password(String? value) {
    if (value == null || value.isEmpty || !isValidPassword(value)) {
      return AppStrings.invalidPassword;
    }
    return null;
  }

  static String? Function(String?) confirmPassword(String original) {
    return (value) {
      if (value != original) return AppStrings.passwordsDoNotMatch;
      return null;
    };
  }
}