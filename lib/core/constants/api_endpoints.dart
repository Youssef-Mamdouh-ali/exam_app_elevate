class ApiEndpoints {
  ApiEndpoints._();


  static const String baseUrl = 'https://exam.elevateegy.com/api/v1/';



  // Auth
  static const String signup='auth/signup';
  static const String forgotPassword = 'auth/forgotPassword';
  static const String verifyResetCode = 'auth/verifyResetCode';
  static const String resetPassword = 'auth/resetPassword';
}
