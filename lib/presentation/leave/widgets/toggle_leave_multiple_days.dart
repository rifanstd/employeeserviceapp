import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleLeaveMultipleDays extends StatelessWidget {
  const ToggleLeaveMultipleDays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 44.w,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.primary500,
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            // buat align right
            width: 16.w,
            height: 16.w,
            decoration: const BoxDecoration(color: AppColors.backgroundWhite, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
