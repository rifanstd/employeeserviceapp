import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SimpleInfoCard extends StatelessWidget {
  final String title;
  final String desc;

  const SimpleInfoCard({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 88.h,
          decoration: BoxDecoration(
            color: AppColors.info100,
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(color: AppColors.strokeInfo, width: 1.w),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10).r,
            child: SvgPicture.asset(
              AppIcons.wave2,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Cuti Besar",
                    title,
                    style: AppTextStyle.smallRegular.copyWith(color: AppColors.textDark),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    // "24 - 25 Mar 2024",
                    desc,
                    style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textDark),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
