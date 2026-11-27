// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/api/auth_api_client.dart' as _i541;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i432;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart'
    as _i299;
import '../../features/auth/data/data_sources/remote/forget_password_fake_remote_data_source.dart'
    as _i959;
import '../../features/auth/data/data_sources/remote/forget_password_remote_data_source.dart'
    as _i716;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/use_cases/forgot_password_use_case.dart'
    as _i897;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i169;
import '../../features/auth/domain/use_cases/verify_reset_code_use_case.dart'
    as _i449;
import '../../features/auth/presentation/forget_password/cubit/forget_password_cubit.dart'
    as _i995;
import '../../features/auth/presentation/forget_password/cubit/reset_password_cubit.dart'
    as _i952;
import '../../features/auth/presentation/forget_password/cubit/verify_code_cubit.dart'
    as _i970;
import '../../features/auth/presentation/register/cubit/register_cubit.dart'
    as _i404;
import '../dio/api_module.dart' as _i162;
import '../dio/dio_module.dart' as _i977;

const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final apiModule = _$ApiModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i716.ForgotPasswordRemoteDataSource>(
      () => _i959.AuthFakeRemoteDataSource(),
      registerFor: {_dev},
    );
    gh.singleton<_i541.AuthApiClient>(
      () => apiModule.authApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i432.AuthRemoteDataSource>(
      () => _i299.AuthRemoteDataSourceImpl(gh<_i541.AuthApiClient>()),
    );
    gh.factory<_i170.AuthRepo>(
      () => _i279.AuthRepoImpl(
        gh<_i716.ForgotPasswordRemoteDataSource>(),
        gh<_i432.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i897.ForgotPasswordUseCase>(
      () => _i897.ForgotPasswordUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i169.ResetPasswordUseCase>(
      () => _i169.ResetPasswordUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i449.VerifyResetCodeUseCase>(
      () => _i449.VerifyResetCodeUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i970.VerifyCodeCubit>(
      () => _i970.VerifyCodeCubit(
        gh<_i449.VerifyResetCodeUseCase>(),
        gh<_i897.ForgotPasswordUseCase>(),
      ),
    );
    gh.lazySingleton<_i1010.RegisterUseCase>(
      () => _i1010.RegisterUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i952.ResetPasswordCubit>(
      () => _i952.ResetPasswordCubit(gh<_i169.ResetPasswordUseCase>()),
    );
    gh.factory<_i404.RegisterCubit>(
      () => _i404.RegisterCubit(gh<_i1010.RegisterUseCase>()),
    );
    gh.factory<_i995.ForgetPasswordCubit>(
      () => _i995.ForgetPasswordCubit(gh<_i897.ForgotPasswordUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}

class _$ApiModule extends _i162.ApiModule {}
