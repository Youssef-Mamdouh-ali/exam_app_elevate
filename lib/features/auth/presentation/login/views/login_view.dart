
import 'package:exam_app_elevate/core/constants/app_colors.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/core/utils/validators.dart';
import 'package:exam_app_elevate/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

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
    return GestureDetector(
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
                CustomTextField(
                  validator: Validators.validateEmail,
                  label: AppStrings.email,
                  controller: _emailController,
                  hint: AppStrings.enterEmail,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  validator: Validators.validatePassword,
                  label: AppStrings.password,
                  controller: _passwordController,
                  hint: AppStrings.enterPassword,
                  isPassword: true,
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                    }
                  },
                  child: const Text(AppStrings.login),
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
                      onPressed: () {},
                      child: const Text(AppStrings.signUp),
                    ),
                  ],
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}
