import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AdditionalInfoCard extends StatelessWidget {
  const AdditionalInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 108.h,
          decoration: BoxDecoration(
            color: AppColors.primary100,
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(color: AppColors.strokeSuccess, width: 1.w),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10).r,
            child: SvgPicture.asset(
              AppIcons.wave4,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.calendarAddGreen),
                      SizedBox(width: 8.w),
                      Text(
                        "Cuti Free",
                        style: AppTextStyle.bodyRegular.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  RichText(
                    text: TextSpan(
                      text: "Mulai ",
                      style: AppTextStyle.bodyRegular.copyWith(fontWeight: FontWeight.w500, color: AppColors.textLightDark),
                      children: [
                        TextSpan(
                          text: "24 Mar 2024",
                          style: AppTextStyle.bodyRegular.copyWith(fontWeight: FontWeight.w700, color: AppColors.textDark),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  RichText(
                    text: TextSpan(
                      text: "Berakhir ",
                      style: AppTextStyle.bodyRegular.copyWith(fontWeight: FontWeight.w500, color: AppColors.textLightDark),
                      children: [
                        TextSpan(
                          text: "-",
                          style: AppTextStyle.bodyRegular.copyWith(fontWeight: FontWeight.w700, color: AppColors.textDark),
                        ),
                      ],
                    ),
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
