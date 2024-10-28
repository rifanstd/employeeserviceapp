import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationBadge extends StatelessWidget {
  final String message;

  const InformationBadge({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5).r,
        color: AppColors.backgroundLight,
      ),
      child: Text(
        message,
        style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textLightDark),
      ),
    );
  }
}
