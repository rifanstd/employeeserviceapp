import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LeaveSummaryCard extends StatelessWidget {
  const LeaveSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0).r,
      padding: const EdgeInsets.all(16).w,
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(10).r,
        border: Border.all(color: AppColors.strokeTeritary, width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Cuti Tahunan",
                      style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 16.w,
                          height: 16.w,
                          padding: const EdgeInsets.all(4).r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.info500,
                          ),
                          child: SvgPicture.asset(
                            AppIcons.calendar,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "3 Days",
                          style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textDark),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Ended on Mar 24, 2024",
                      style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  border: Border.all(width: 1.w, color: AppColors.strokeTeritary.withOpacity(0.5)),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Tahun Diperpanjang",
                      style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 16.w,
                          height: 16.h,
                          padding: const EdgeInsets.all(4).r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.info500,
                          ),
                          child: SvgPicture.asset(
                            AppIcons.eventRepeat,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "0 Days",
                          style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textDark),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "-",
                      style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 8.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.iconLightDark,
                  borderRadius: BorderRadius.circular(30).r,
                ),
              ),
              SizedBox(width: 2.w),
              Container(
                width: 4.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.iconLightDark.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30).r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
