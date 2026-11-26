import 'package:exam_app_elevate/configure/di/di.dart';
import 'package:exam_app_elevate/core/constants/app_strings.dart';
import 'package:exam_app_elevate/core/utils/app_validators.dart';
import 'package:exam_app_elevate/features/auth/data/models/register_request_model.dart';
import 'package:exam_app_elevate/features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:exam_app_elevate/features/auth/presentation/register/cubit/register_events.dart';
import 'package:exam_app_elevate/features/auth/presentation/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child:  Scaffold(
          appBar: AppBar(

            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {

              },
            ),
            title: const Text(AppStrings.signUp),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      TextFormField(
                        controller: _userNameController,
                        validator: AppValidators.validateUsername,
                        decoration: const InputDecoration(
                          labelText: AppStrings.userName,
                          hintText: AppStrings.enterUserName,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: AppValidators.validateName,
                                controller: _firstNameController,
                                decoration: const InputDecoration(
                                  labelText: AppStrings.firstName,
                                  hintText: AppStrings.enterFirstName,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                validator: AppValidators.validateName,
                                controller: _lastNameController,
                                decoration: const InputDecoration(
                                  labelText: AppStrings.lastName,
                                  hintText: AppStrings.enterLastName,
                                ),
                              ),
                            ),
                          ]
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        validator: AppValidators.email,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: AppStrings.email,
                          hintText: AppStrings.enterEmail,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator:AppValidators.password,
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: AppStrings.password,
                                  hintText: AppStrings.enterPassword,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                validator: (value) => AppValidators.confirmPassword(
                                  _passwordController.text,
                                )(value),
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: AppStrings.confirmPassword,
                                  hintText: AppStrings.enterConfirmPassword,
                                ),
                              ),
                            ),
                          ]
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        validator: AppValidators.validatePhoneNumber,
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: AppStrings.phoneNumber,
                          hintText: AppStrings.enterPhoneNumber,
                        ),
                      ),
                      const SizedBox(height: 48.0),
                      BlocConsumer<RegisterCubit, RegisterState>(
                          builder: (context, state){
                            final isLoading = state.userRegisterState?.isLoading ?? false;
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                              ),
                              onPressed:isLoading ? null : () {

                                if (_formKey.currentState!.validate()) {

                                  context.read<RegisterCubit>().doEvent(
                                    UserRegisterEvent(
                                      RegisterRequestModel(
                                        username: _userNameController.text,
                                        firstName: _firstNameController.text,
                                        lastName: _lastNameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        rePassword: _confirmPasswordController.text,
                                        phone: _phoneNumberController.text,
                                      ),
                                    ),
                                  );
                                  _userNameController.clear();
                                  _firstNameController.clear();
                                  _lastNameController.clear();
                                  _emailController.clear();
                                  _passwordController.clear();
                                  _confirmPasswordController.clear();
                                  _phoneNumberController.clear();
                                  _formKey.currentState!.reset();
                                }
                              },
                              child:isLoading ? const CircularProgressIndicator()
                                  : const Text(AppStrings.signUp),
                            );
                          },
                          listener: (context, state){
                            if(state.userRegisterState?.errMsg != null){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.userRegisterState!.errMsg!,
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            if(state.userRegisterState?.data != null){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(AppStrings.successLogin),
                                  backgroundColor: Colors.green,

                                ),

                              );
                              //TODO navigate to home screen
                            }
                          }
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppStrings.alreadyHaveAccount),
                          TextButton(
                            onPressed: () {
                              //TODO navigate to login screen
                            },
                            child: const Text(AppStrings.login,
                            ),
                          ),
                        ],
                      ),
                    ]
                ),
              ),
            ),
          )
      ),
    );
  }
}
