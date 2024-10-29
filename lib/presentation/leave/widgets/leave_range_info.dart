import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LeaveRangeInfo extends StatelessWidget {
  const LeaveRangeInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppIcons.suitcaseTag,
          width: 32.w,
          height: 33.2.h,
          color: AppColors.primary500,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cuti',
                style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
              ),
              SizedBox(height: 4.h),
              RichText(
                text: TextSpan(
                  text: 'Pekerja cuti pada tanggal ',
                  style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textLightDark),
                  children: [
                    TextSpan(
                      text: '23 Sep - 6 Oct 2023',
                      style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
