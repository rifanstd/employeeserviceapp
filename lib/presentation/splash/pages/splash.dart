import 'package:employeeserviceapp/common/helper/navigation/app_navigation.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/presentation/auth/pages/signin.dart';
import 'package:employeeserviceapp/presentation/personal_service/pages/personal_service.dart';
import 'package:employeeserviceapp/presentation/splash/bloc/splash_cubit.dart';
import 'package:employeeserviceapp/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashCubit()..appStarted(),
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              AppNavigator.pushReplacement(context, SignInPage());
            }

            if (state is Authenticated) {
              AppNavigator.pushReplacement(context, const PersonalServicePage());
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CupertinoActivityIndicator(color: AppColors.info500),
                SizedBox(height: 16.h),
                const Text('Mohon tunggu...'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
