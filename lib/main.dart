import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/core/router/app_router.dart';
import 'package:flutter/material.dart';

import 'configure/di/di.dart';
import 'core/theme/app_theme.dart';

void main() {
  configureDependencies(env: AppStrings.dev);
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}
