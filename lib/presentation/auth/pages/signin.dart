import 'package:employeeserviceapp/common/helper/navigation/app_navigation.dart';
import 'package:employeeserviceapp/common/message/display_message.dart';
import 'package:employeeserviceapp/core/configs/theme/app_button_style.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_input_decoration_style.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:employeeserviceapp/data/auth/models/signin_req_params.dart';
import 'package:employeeserviceapp/presentation/auth/bloc/auth_cubit.dart';
import 'package:employeeserviceapp/presentation/auth/bloc/auth_state.dart';
import 'package:employeeserviceapp/presentation/auth/pages/signup.dart';
import 'package:employeeserviceapp/presentation/leave/pages/leave.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: kToolbarHeight.h),
        child: BlocProvider(
          create: (context) => AuthCubit(),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SignInOnAttempt) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const AlertDialog(
                    content: CupertinoActivityIndicator(
                      radius: 20,
                      color: AppColors.info500,
                    ),
                  ),
                );
              } else if (state is SignInSuccess) {
                AppNavigator.pop(context);
                AppNavigator.pushReplacement(context, const InformationLeavePage());
              } else if (state is SignInFailed) {
                AppNavigator.pop(context);
                DisplayMessage.errorMessage(context, state.message);
              }
            },
            child: LayoutBuilder(
              builder: (ctx, constraints) => SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SignIn',
                        style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textDark),
                      ),
                      SizedBox(height: 8.h),
                      Text('Masuk untuk melanjutkan', style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark)),
                      SizedBox(height: 32.h),
                      TextFormField(
                        controller: _emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Email cannot be empty';
                          return null;
                        },
                        decoration: AppInputDecorationStyle.defaultInputDecoration(hintText: 'Email'),
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        controller: _passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Password cannot be empty';
                          return null;
                        },
                        decoration: AppInputDecorationStyle.defaultInputDecoration(hintText: 'Password'),
                      ),
                      SizedBox(height: 16.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: FilledButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().attemptToSignIn(
                                        SignInReqParams(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                }
                              },
                              style: AppButtonStyle.filledInfo,
                              child: state is SignInOnAttempt ? const CupertinoActivityIndicator(color: Colors.white) : const Text('Masuk'),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Belum punya akun? ',
                            style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
                            children: [
                              TextSpan(
                                text: 'Daftar',
                                style: AppTextStyle.bodyRegular.copyWith(color: AppColors.info500),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    AppNavigator.push(context, SignUpPage());
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
