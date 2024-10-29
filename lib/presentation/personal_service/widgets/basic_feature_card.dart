import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BasicFeatureCard extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const BasicFeatureCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: (constraints.maxWidth * 0.5 - 16).w,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(color: AppColors.strokeTeritary, width: 1.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.date,
                width: 24.w,
              ),
              SizedBox(width: 16.w),
              Text(
                title,
                style: AppTextStyle.heading6Medium.copyWith(color: AppColors.textDark),
              ),
            ],
          ),
        ),
      );
    });
  }
}
