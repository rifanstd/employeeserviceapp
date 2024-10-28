import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle heading5Bold = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading6Medium = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle heading8Medium = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyRegular = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle smallRegular = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
  );
}
