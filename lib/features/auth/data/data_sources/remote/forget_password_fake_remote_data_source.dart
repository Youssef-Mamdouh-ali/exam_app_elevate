import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/configure/di/app_environment.dart';
import 'package:injectable/injectable.dart';

import 'forget_password_remote_data_source.dart';

@Injectable(as: ForgotPasswordRemoteDataSource, env: [AppEnvironment.dev])
class AuthFakeRemoteDataSource implements ForgotPasswordRemoteDataSource {
  static const String _validEmail = 'demo@gmail.com';
  static const String _validCode = '123456';

  static String _currentPassword = '12345678';
  static bool _isCodeVerified = false;

  @override
  Future<BaseResponse<void>> forgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.trim().toLowerCase() != _validEmail) {
      return ErrorBaseResponse('Email not found');
    }

    _isCodeVerified = false;

    return SuccessBaseResponse(null);
  }

  @override
  Future<BaseResponse<void>> verifyResetCode(String code) async {
    await Future.delayed(const Duration(seconds: 1));

    if (code != _validCode) {
      return ErrorBaseResponse('Invalid code');
    }

    _isCodeVerified = true;

    return SuccessBaseResponse(null);
  }

  @override
  Future<BaseResponse<void>> resetPassword(
    String email,
    String newPassword,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.trim().toLowerCase() != _validEmail) {
      return ErrorBaseResponse('Email not found');
    }

    if (!_isCodeVerified) {
      return ErrorBaseResponse('Please verify the OTP first');
    }

    if (newPassword.isEmpty) {
      return ErrorBaseResponse('Password cannot be empty');
    }

    _currentPassword = newPassword;
    _isCodeVerified = false;

    return SuccessBaseResponse(null);
  }
}
