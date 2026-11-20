
import 'package:exam_app_elevate/configure/di/di.dart';
import 'package:exam_app_elevate/core/constants/app_colors.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/core/utils/validators.dart';
import 'package:exam_app_elevate/core/widgets/custom_text_field.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_events.dart';
import 'package:exam_app_elevate/features/auth/presentation/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool value = false;


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
                      validator: (value) => Validators.validateEmail(value),
                      decoration: const InputDecoration(
                        hintText: AppStrings.email,
                      ),
                    ),
                    const SizedBox(height: 16),
                   TextFormField(
                     controller: _passwordController,
                     validator: (value) => Validators.validatePassword(value),
                     obscureText: true,
                     decoration: const InputDecoration(
                       hintText: AppStrings.password,
                     ),
                   ),

                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        const Text(AppStrings.rememberMe,
                            style: TextStyle(

                              fontWeight: FontWeight.w400,
                            )
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(AppStrings.forgetPassword),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        final isLoading = state.userLoginState?.isLoading ?? false;
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: isLoading? null : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().doEvent(
                                  UserLoginEvent(
                                      _emailController.text,
                                      _passwordController.text
                                  )
                              );
                            }
                          },
                          child: isLoading ? const CircularProgressIndicator()
                              : const Text(AppStrings.login),
                        );
                      }),

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
                          onPressed: () {},
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
