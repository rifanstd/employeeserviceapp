import 'package:employeeserviceapp/common/helper/navigation/app_navigation.dart';
import 'package:employeeserviceapp/common/widgets/confirmation_alert_dialog.dart';
import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:employeeserviceapp/presentation/home/pages/home_page.dart';
import 'package:employeeserviceapp/presentation/leave/pages/leave_page.dart';
import 'package:employeeserviceapp/presentation/personal_service/widgets/basic_feature_card.dart';
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
                child: const Badge(
                  backgroundColor: AppColors.danger500,
                  child: Icon(
                    Icons.notifications_rounded,
                    color: AppColors.iconWhite,
                  ),
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
                    BasicFeatureCard(
                        title: 'Leave',
                        onTap: () {
                          AppNavigator.push(context, const InformationLeavePage());
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
                        _buildTransactionItem(context, "Probation", AppIcons.observation),
                        _buildTransactionItem(context, "Leave", AppIcons.date),
                        _buildTransactionItem(context, "Dinas", AppIcons.travel),
                        _buildTransactionItem(context, "Izin", AppIcons.form),
                        _buildTransactionItem(context, "Lembur", AppIcons.document),
                        _buildTransactionItem(context, "Service Center", AppIcons.question),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Other Features",
                      style: AppTextStyle.heading8Medium.copyWith(color: AppColors.textLightDark),
                    ),
                    SizedBox(height: 8.h),
                    BasicFeatureCard(
                      title: 'Movies',
                      onTap: () {
                        AppNavigator.push(context, const HomePage());
                      },
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

  Widget _buildTransactionItem(BuildContext context, String title, String iconPath) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ConfirmationAlertDialog(
              iconPath: AppIcons.failedIlustration,
              title: 'Oops!',
              text: 'Maaf fitur ini belum tersedia',
              onConfirm: () {
                AppNavigator.pop(context);
              }),
        );
      },
      child: Column(
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
      ),
    );
  }
}
