import 'package:exam_app_elevate/core/constants/app_colors.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/core/router/app_routes.dart';
import 'package:exam_app_elevate/features/auth/presentation/forget_password/cubit/verify_code_event.dart';
import 'package:exam_app_elevate/features/auth/presentation/forget_password/cubit/verify_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../configure/di/di.dart';
import '../cubit/verify_code_cubit.dart';

class VerifyCodeView extends StatelessWidget {
  final String email;

  const VerifyCodeView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VerifyCodeCubit>(),
      child: _VerifyCodeBody(email: email),
    );
  }
}

class _VerifyCodeBody extends StatelessWidget {
  final String email;

  const _VerifyCodeBody({required this.email});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 56,
      textStyle: textTheme.titleLarge,
      decoration: BoxDecoration(
        color: AppColors.blue10,
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.error),
      ),
    );
    final cubit = context.read<VerifyCodeCubit>();

    return MultiBlocListener(
      listeners: [
        BlocListener<VerifyCodeCubit, VerifyCodeState>(
          listenWhen: (prev, curr) =>
              prev.verifyState.isLoading && !curr.verifyState.isLoading,
          listener: (context, state) {
            final verify = state.verifyState;
            if (verify.errMsg != null) {
              _showSnackBar(context, verify.errMsg!);
              return;
            }
            if (verify.data == true) {
              context.push(AppRoutes.resetPassword, extra: email);
            }
          },
        ),
        BlocListener<VerifyCodeCubit, VerifyCodeState>(
          listenWhen: (prev, curr) =>
              prev.resendState.isLoading && !curr.resendState.isLoading,
          listener: (context, state) {
            final resend = state.resendState;
            if (resend.errMsg != null) {
              _showSnackBar(context, resend.errMsg!);
            }
          },
        ),
      ],
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
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(AppStrings.emailVerification, style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                AppStrings.verifyCodeSubtitle,
                textAlign: TextAlign.center,
                style: textTheme.bodySmall,
              ),
              const SizedBox(height: 32),
              BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
                builder: (context, state) {
                  return Pinput(
                    length: 6,
                    keyboardType: TextInputType.number,
                    enabled: !state.verifyState.isLoading,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: AppColors.blueBase),
                      ),
                    ),
                    errorPinTheme: errorPinTheme,
                    forceErrorState: state.verifyState.errMsg != null,
                    errorText: AppStrings.invalidCode,
                    onCompleted: (code) =>
                        cubit.doEvent(VerifyCodeSubmitEvent(code)),
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.didNotReceiveCode,
                    style: textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => cubit.doEvent(ResendCodeEvent(email)),
                    child: const Text(AppStrings.resend),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
