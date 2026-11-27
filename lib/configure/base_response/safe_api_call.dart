import 'package:exam_app_elevate/configure/base_response/base_response.dart';

Future<BaseResponse<T>> safeApiCall<T>(Future<T> Function() call) async {
  try {
    return SuccessBaseResponse<T>(await call());
  } catch (e) {
    return ErrorBaseResponse.fromError(e);
  }
}
