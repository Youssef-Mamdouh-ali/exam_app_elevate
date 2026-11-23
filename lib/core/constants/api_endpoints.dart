class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://exam.elevateegy.com/';

  // Auth
  static const String forgotPassword = 'api/v1/auth/forgotPassword';
  static const String verifyResetCode = 'api/v1/auth/verifyResetCode';
  static const String resetPassword = 'api/v1/auth/resetPassword';
}
