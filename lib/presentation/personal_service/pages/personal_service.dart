import 'package:employeeserviceapp/common/helper/navigation/app_navigation.dart';
import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:employeeserviceapp/presentation/leave/pages/leave.dart';
import 'package:employeeserviceapp/presentation/personal_service/widgets/leave_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalServicePage extends StatelessWidget {
  const PersonalServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.info500,
        surfaceTintColor: AppColors.info500,
        foregroundColor: AppColors.iconWhite,
        title: Text(
          'Employee Services',
          style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textWhite),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {},
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search_rounded,
                  color: AppColors.iconWhite,
                ),
              ),
              SizedBox(width: 16.w),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.notifications_rounded,
                  color: AppColors.iconWhite,
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 70.h,
                color: AppColors.info500,
              ),
              const LeaveSummaryCard(),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0).r,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    Text(
                      "Favorite",
                      style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textDark),
                    ),
                    SizedBox(height: 16.h),
                    LayoutBuilder(builder: (context, constraints) {
                      return GestureDetector(
                        onTap: () {
                          AppNavigator.push(context, const InformationLeavePage());
                        },
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
                                "Leave",
                                style: AppTextStyle.heading6Medium.copyWith(color: AppColors.textDark),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 16.h),
                    Text(
                      "Transaction",
                      style: AppTextStyle.heading8Medium.copyWith(color: AppColors.textLightDark),
                    ),
                    SizedBox(height: 8.h),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      children: [
                        _buildTransactionItem("Probation", AppIcons.observation),
                        _buildTransactionItem("Leave", AppIcons.date),
                        _buildTransactionItem("Dinas", AppIcons.travel),
                        _buildTransactionItem("Izin", AppIcons.form),
                        _buildTransactionItem("Lembur", AppIcons.document),
                        _buildTransactionItem("Service Center", AppIcons.question),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String iconPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          width: 32.w,
          height: 32.h,
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
        ),
      ],
    );
  }
}
