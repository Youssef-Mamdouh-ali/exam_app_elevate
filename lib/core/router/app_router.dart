import 'package:exam_app_elevate/core/router/app_routes.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/views/login_view.dart';
import 'package:exam_app_elevate/features/auth/presentation/register/views/register_view.dart';
import 'package:exam_app_elevate/features/auth/presentation/forget_password/views/forget_password_view.dart';
import 'package:exam_app_elevate/features/auth/presentation/forget_password/views/reset_password_view.dart';
import 'package:exam_app_elevate/features/auth/presentation/forget_password/views/verify_code_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.forgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),

      GoRoute(
        path: AppRoutes.verifyCode,
        builder: (context, state) {
          final email = state.extra as String;
          return VerifyCodeView(email: email);
        },
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) {
          final email = state.extra as String;
          return ResetPasswordView(email: email);
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const Scaffold(),
      ),
    ],
  );
}
