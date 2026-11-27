import 'package:exam_app_elevate/core/constants/app_strings.dart';




import 'package:exam_app_elevate/core/constants/app_strings/validation_strings.dart';

class AppValidators {
  AppValidators._();

  static final RegExp _emailRegex = RegExp(
    r'^[\w\.\-+]+@([\w\-]+\.)+[\w\-]{2,}$',
  );

  static bool isValidEmail(String email) => _emailRegex.hasMatch(email.trim());

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty || !isValidEmail(value)) {
      return AppStrings.invalidEmail;
  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,}$',
  );
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationStrings.invalidPhoneNumber;
    }
    return null;
  }
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationStrings.invalidUsername;
    }
    return null;
  }

  static final RegExp _passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationStrings.invalidName;
    }
    return null;
  }

  static bool isValidEmail(String email) => _emailRegex.hasMatch(email.trim());

  static bool isValidPassword(String password) =>
      _passwordRegex.hasMatch(password);

  static String? email(String? value) {
    if (value == null || !isValidEmail(value)) {
      return ValidationStrings.invalidEmail;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty || !isValidPassword(value)) {
      return AppStrings.invalidPassword;
    if (value == null || !isValidPassword(value)) {
      return ValidationStrings.invalidPassword;
    }
    return null;
  }

  static String? Function(String?) confirmPassword(String original) {
    return (value) {

      if (value != original) return ValidationStrings.passwordsDoNotMatch;
      return null;
    };
  }
}