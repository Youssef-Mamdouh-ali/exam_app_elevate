import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';

sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  final T data;

  SuccessBaseResponse(this.data);
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  final String message;

  ErrorBaseResponse(this.message);

  ErrorBaseResponse.fromError(Object? error)
      : message = error == null
      ? AppStrings.somethingWentWrong
      : _getErrorMsg(error);

  static String _getErrorMsg(Object error) {

    if (error is DioException) {
      switch (error.type) {

        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.transformTimeout:
          return AppStrings.timeout;
        case DioExceptionType.connectionError:
          return AppStrings.noInternet;
        case DioExceptionType.badCertificate:
          return AppStrings.badCertificate;
        case DioExceptionType.cancel:
          return AppStrings.requestCancelled;
        case DioExceptionType.badResponse:
          return _extractServerMessage(error.response?.data) ??
              AppStrings.somethingWentWrong;
        case DioExceptionType.unknown:
          return AppStrings.unexpectedError;
      }
    }
    return AppStrings.somethingWentWrong;
  }

  static String? _extractServerMessage(dynamic data) {
    if (data is Map<String, dynamic> && data[AppStrings.message] is String) {
      return data[AppStrings.message] as String;
    }
    return null;
  }
}