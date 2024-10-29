import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TFormField extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Color? fillColor;

  const TFormField({
    super.key,
    required this.text,
    this.icon,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.w,
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      decoration: BoxDecoration(
        color: fillColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(5).r,
        border: Border.all(color: AppColors.strokeTeritary, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
          ),
          if (icon != null) const Spacer(),
          if (icon != null)
            Container(
              width: 40.w,
              height: 40.w,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(5).r,
                border: Border.all(color: AppColors.strokeTeritary, width: 1.w),
              ),
              child: icon,
            ),
        ],
      ),
    );
  }
}
