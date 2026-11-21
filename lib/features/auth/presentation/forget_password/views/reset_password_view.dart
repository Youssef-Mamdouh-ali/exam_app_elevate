import 'package:exam_app_elevate/configure/di/di.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/core/router/app_routes.dart';
import 'package:exam_app_elevate/core/utils/app_validators.dart';
import 'package:exam_app_elevate/features/auth/presentation/forget_password/cubit/reset_password_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/reset_password_cubit.dart';
import '../cubit/reset_password_state.dart';

class ResetPasswordView extends StatelessWidget {
  final String email;

  const ResetPasswordView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResetPasswordCubit>(),
      child: _ResetPasswordBody(email: email),
    );
  }
}

class _ResetPasswordBody extends StatefulWidget {
  final String email;

  const _ResetPasswordBody({required this.email});

  @override
  State<_ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<_ResetPasswordBody> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ResetPasswordCubit>().doEvent(
        SubmitResetPasswordEvent(
          email: widget.email,
          newPassword: _passwordController.text,
        ),
      );
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (prev, curr) =>
          prev.resetState.isLoading && !curr.resetState.isLoading,
      listener: (context, state) {
        final reset = state.resetState;

        if (reset.errMsg != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(reset.errMsg!)));
          return;
        }

        if (reset.data == true) {
          context.go(AppRoutes.login);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.password),
          leading: IconButton(
            onPressed: () {
              if (context.canPop()) context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  AppStrings.resetPasswordTitle,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.resetPasswordSubtitle,
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: AppValidators.password,
                  decoration: const InputDecoration(
                    labelText: AppStrings.newPassword,
                    hintText: AppStrings.enterNewPassword,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  validator: (value) => AppValidators.confirmPassword(
                    _passwordController.text,
                  )(value),
                  decoration: const InputDecoration(
                    labelText: AppStrings.confirmPassword,
                    hintText: AppStrings.confirmPassword,
                  ),
                ),
                const SizedBox(height: 40),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    final isLoading = state.resetState.isLoading;
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _onContinue,
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(AppStrings.continueText),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
