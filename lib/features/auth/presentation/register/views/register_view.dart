import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
           context.go('/login');
          },
        ),
        title: const Text('Register'),
      ),
      body: const Center(
        child: Text('Register View and ${AppStrings.successLogin}'),
      ),
    );
  }
}
