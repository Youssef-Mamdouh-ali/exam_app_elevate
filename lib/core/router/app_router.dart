import 'package:exam_app_elevate/core/router/app_routes.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
