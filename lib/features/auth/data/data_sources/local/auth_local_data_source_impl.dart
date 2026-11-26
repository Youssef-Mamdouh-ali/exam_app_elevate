import 'package:exam_app_elevate/configure/base_response/base_response.dart';
import 'package:exam_app_elevate/configure/base_response/safe_api_call.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/core/constants/app_strings/app_keys.dart';
import 'package:exam_app_elevate/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _storage;

  AuthLocalDataSourceImpl(this._storage);

  @override
  Future<BaseResponse<String?>> getToken() {
    return safeApiCall<String?>(
          () => _storage.read(key: AppKeys.tokenKey),
    );
  }

  @override
  Future<BaseResponse<void>> removeToken() {
    return safeApiCall<void>(
          () => _storage.delete(key:AppKeys.tokenKey),
    );
  }

  @override
  Future<BaseResponse<void>> saveToken(String token) {
    return safeApiCall<void>(
          () => _storage.write(key:AppKeys.tokenKey, value: token),
    );
  }
}