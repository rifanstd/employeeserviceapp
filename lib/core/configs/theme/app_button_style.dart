import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle filledInfo = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.backgroundLight;
        }
        return AppColors.info500;
      },
    ),
    // padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    textStyle: MaterialStateProperty.all(AppTextStyle.bodyRegular),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.textWhite;
        }
        return AppColors.textWhite;
      },
    ),
  );

  static ButtonStyle filledAlt = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.backgroundLight;
        }
        return AppColors.backgroundLight;
      },
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    elevation: const MaterialStatePropertyAll(0),
    side: MaterialStateProperty.all(
      const BorderSide(color: AppColors.strokeTeritary, width: 1), // Warna dan ketebalan border
    ),
    textStyle: MaterialStateProperty.all(AppTextStyle.bodyRegular),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.textDark;
        }
        return AppColors.textDark;
      },
    ),
  );
}
