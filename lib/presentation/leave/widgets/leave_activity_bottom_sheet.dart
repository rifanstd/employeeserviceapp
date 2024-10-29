import 'package:employeeserviceapp/common/helper/navigation/app_navigation.dart';
import 'package:employeeserviceapp/common/widgets/confirmation_alert_dialog.dart';
import 'package:employeeserviceapp/common/widgets/custom_divider.dart';
import 'package:employeeserviceapp/core/configs/assets/app_icons.dart';
import 'package:employeeserviceapp/core/configs/theme/app_button_style.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaveActivityBottomSheet extends StatelessWidget {
  const LeaveActivityBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Menyesuaikan tinggi sesuai konten
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 24.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.iconLight,
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Tambah Aktivitas Cuti',
                style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textDark),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tipe Cuti',
                    style: AppTextStyle.heading8Medium.copyWith(color: AppColors.textDark),
                  ),
                  Text(
                    'Cuti Besar',
                    style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Durasi',
                    style: AppTextStyle.heading8Medium.copyWith(color: AppColors.textDark),
                  ),
                  Text(
                    '3 Hari',
                    style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const TDivider(),
              SizedBox(height: 16.h),
              Text(
                'Apakah kamu yakin ingin menambahkan aktivitas cuti ini?',
                style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        AppNavigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => ConfirmationAlertDialog(
                            iconPath: AppIcons.failedIlustration,
                            title: 'Oops!',
                            text: 'Aktivitas cuti kamu batal ditambahkan',
                            onConfirm: () => AppNavigator.pop(context),
                          ),
                        );
                      },
                      style: AppButtonStyle.filledAlt,
                      child: const Text('Batal'),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        AppNavigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => ConfirmationAlertDialog(
                            iconPath: AppIcons.successIlustration,
                            title: 'Woohoo!',
                            text: 'Aktivitas cuti kamu berhasil ditambahkan',
                            onConfirm: () => AppNavigator.pop(context),
                          ),
                        );
                      },
                      style: AppButtonStyle.filledInfo,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add, color: AppColors.iconWhite),
                          SizedBox(width: 4.w),
                          const Text("Tambahkan"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
