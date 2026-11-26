

import 'package:exam_app_elevate/configure/di/di.dart';
import 'package:exam_app_elevate/core/constants/app_colors.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/core/router/app_routes.dart';
import 'package:exam_app_elevate/core/utils/app_validators.dart';

import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_events.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _rememberMe = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _rememberMe.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (context)=>getIt<LoginCubit>(),
        child: GestureDetector(
          onTap: ()=> FocusScope.of(context).unfocus(),
          child: Scaffold(

              appBar: AppBar(
                title: const Text(AppStrings.login,
                    style: TextStyle(
                      fontFamily: AppStrings.fontName,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              body:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key:_formKey,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TextFormField(
                        controller: _emailController,
                        validator: (value) => AppValidators.email(value),
                        decoration: const InputDecoration(
                          hintText: AppStrings.email,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) => AppValidators.password(value),
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: AppStrings.password,
                        ),
                      ),

                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ValueListenableBuilder<bool>(
                            valueListenable: _rememberMe,
                            builder: (context, value, _) {
                              return Checkbox(
                                value: value,
                                onChanged: (v) => _rememberMe.value = v ?? false,
                              );
                            },
                          ),
                          const Text(AppStrings.rememberMe,
                              style: TextStyle(

                                fontWeight: FontWeight.w400,
                              )
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              context.push(AppRoutes.forgetPassword);
                            },
                            child: const Text(AppStrings.forgetPassword),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      BlocConsumer<LoginCubit, LoginState>(
                        listenWhen: (prev, curr) =>
                        prev.userLoginState != curr.userLoginState,
                        listener: (context, state) {
                          if (state.userLoginState.errMsg != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.userLoginState.errMsg!),
                                backgroundColor: AppColors.error,
                              ),
                            );
                          }
                          if (state.userLoginState.data != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(AppStrings.successLogin),
                                backgroundColor: AppColors.blue90,
                              ),
                            );
                            context.go(AppRoutes.home);
                          }
                        },
                        builder: (context, state) {
                          final isLoading = state.userLoginState.isLoading ;
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: isLoading? null : () {
                              if (_formKey.currentState!.validate()) {

                                context.read<LoginCubit>().doEvent(
                                  UserLoginEvent(
                                    _emailController.text,
                                    _passwordController.text,
                                    rememberMe: _rememberMe.value,
                                  ),

                                );

                              }
                            },
                            child: isLoading ? const CircularProgressIndicator()
                                : const Text(AppStrings.login),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppStrings.donotHaveAccount,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                          TextButton(
                            onPressed: () {
                              context.push(AppRoutes.register);
                            },
                            child:  Text(AppStrings.signUp),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              )
          ),
        )
    );
  }
}