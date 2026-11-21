import 'package:exam_app_elevate/configure/di/di.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/core/router/app_routes.dart';
import 'package:exam_app_elevate/core/utils/app_validators.dart';
import 'package:exam_app_elevate/features/auth/presentation/forget_password/cubit/forget_password_cubit.dart';
import 'package:exam_app_elevate/features/auth/presentation/forget_password/cubit/forget_password_events.dart';
import 'package:exam_app_elevate/features/auth/presentation/forget_password/cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgetPasswordCubit>(),
      child: const _ForgetPasswordBody(),
    );
  }
}

class _ForgetPasswordBody extends StatelessWidget {
  const _ForgetPasswordBody();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<ForgetPasswordCubit>();

    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (prev, curr) =>
          prev.sendEmailState.isLoading && !curr.sendEmailState.isLoading,
      listener: (context, state) {
        final send = state.sendEmailState;

        if (send.errMsg != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(send.errMsg!)));
          return;
        }

        if (send.data != null) {
          context.push(AppRoutes.verifyCode, extra: send.data);
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  AppStrings.forgetPasswordTitle,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.forgetPasswordSubtitle,
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: cubit.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: AppValidators.email,
                  decoration: const InputDecoration(
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterEmail,
                  ),
                ),
                const SizedBox(height: 40),
                BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                  builder: (context, state) {
                    final isLoading = state.sendEmailState.isLoading;
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () => _onContinue(cubit),
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

  void _onContinue(ForgetPasswordCubit cubit) {
    if (cubit.formKey.currentState?.validate() ?? false) {
      cubit.doEvent(SendEmailEvent(cubit.emailController.text.trim()));
    }
  }
}
