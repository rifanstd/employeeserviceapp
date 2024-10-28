import 'package:employeeserviceapp/core/configs/theme/app_theme.dart';
import 'package:employeeserviceapp/presentation/personal_service/pages/personal_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(393, 780),
      splitScreenMode: false,
      minTextAdapt: true,
      enableScaleText: () => true,
      enableScaleWH: () => true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        home: const PersonalServicePage(),
      ),
    );
  }
}
