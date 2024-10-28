import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ComplexInfoCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final String? preMessage;
  final String startDate;
  final String endDate;
  final String waveDecorationPath;
  final double? customHeight;
  final Color? bgColor;
  final Color? borderColor;

  const ComplexInfoCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.startDate,
    required this.endDate,
    required this.waveDecorationPath,
    this.preMessage,
    this.customHeight,
    this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: customHeight?.h ?? 236.h,
          decoration: BoxDecoration(
            color: bgColor ?? AppColors.primary500,
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(color: borderColor ?? AppColors.strokeSuccess, width: 1.w),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10).r,
            child: SvgPicture.asset(
              waveDecorationPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.heading6Medium.copyWith(color: AppColors.textWhite),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 60.w,
                    height: 60.h,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.backgroundWhite.withOpacity(0.12),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.calendarAddWhite,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  if (preMessage != null)
                    Text(
                      preMessage!,
                      style: AppTextStyle.heading8Medium.copyWith(color: AppColors.textWhite),
                      textAlign: TextAlign.center,
                    ),
                  Text(
                    startDate,
                    style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textWhite),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 34.h),
                  Text(
                    "Berakhir $endDate",
                    style: AppTextStyle.smallRegular.copyWith(color: AppColors.textWhite),
                    textAlign: TextAlign.center,
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
