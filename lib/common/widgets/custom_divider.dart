import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TDivider extends StatelessWidget {
  const TDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.strokeTeritary, width: 1.w),
      ),
    );
  }
}
