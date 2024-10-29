import 'package:employeeserviceapp/common/helper/navigation/app_navigation.dart';
import 'package:employeeserviceapp/common/widgets/custom_bottom_app_bar.dart';
import 'package:employeeserviceapp/common/widgets/information_badge.dart';
import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:employeeserviceapp/presentation/leave/pages/leave_activity_page.dart';
import 'package:employeeserviceapp/presentation/leave/widgets/additional_info_card.dart';
import 'package:employeeserviceapp/presentation/leave/widgets/complex_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/simple_info_card.dart';

class InformationLeavePage extends StatelessWidget {
  const InformationLeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave'),
      ),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.strokeTeritary, width: 1.w)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Information Leave",
                      style: AppTextStyle.heading5Bold.copyWith(color: AppColors.iconDark),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Please check detail your information leave ",
                      style: AppTextStyle.smallRegular.copyWith(color: AppColors.iconLightDark),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    const InformationBadge(
                      message: "Berikut informasi terkait cuti yang dapat dilakukan sebelum membuat request cuti, pilih \"create form leave\" untuk membuat pengajuan cuti",
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const ComplexInfoCard(
                                title: 'Cuti',
                                preMessage: 'Mulai dari',
                                startDate: '24 Mar 2024',
                                endDate: '25 Mar 2024',
                                iconPath: AppIcons.calendarAddWhite,
                                waveDecorationPath: AppIcons.wave1,
                              ),
                              SizedBox(height: 16.h),
                              const SimpleInfoCard(title: 'Cuti Besar', desc: '24 - 25 Mar 2024'),
                              SizedBox(height: 16.h),
                              const SimpleInfoCard(title: 'Perpanjangan Cuti Tahunan', desc: '24 Mar 2024'),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const AdditionalInfoCard(),
                              SizedBox(height: 16.h),
                              const ComplexInfoCard(
                                title: 'Cuti Tahunan',
                                startDate: '3 Hari',
                                endDate: '24 Mar 2024',
                                iconPath: AppIcons.suitcaseTag,
                                waveDecorationPath: AppIcons.wave5,
                                customHeight: 216,
                                bgColor: AppColors.info500,
                                borderColor: AppColors.strokeInfo,
                              ),
                              SizedBox(height: 16.h),
                              const SimpleInfoCard(title: 'Cuti Bersama Keluarga', desc: '24 Mar 2024'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundWhite,
                        borderRadius: BorderRadius.circular(10).r,
                        border: Border.all(color: AppColors.strokeTeritary, width: 1.w),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.calendarAddGreen),
                              SizedBox(width: 8.w),
                              Text(
                                "Izin",
                                style: AppTextStyle.heading8Medium.copyWith(color: AppColors.textDark, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "-",
                            style: AppTextStyle.heading8Medium.copyWith(color: AppColors.textDark, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 72.h),
                  ],
                ),
              ),
            ),
          ),
          TBottomAppBar(
            positiveChild: const Text('Buat Form Leave'),
            onPositiveClicked: () {
              AppNavigator.push(context, const LeaveActivityPage());
            },
          ),
        ],
      ),
    );
  }
}
