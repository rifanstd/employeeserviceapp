import 'package:employeeserviceapp/common/helper/navigation/app_navigation.dart';
import 'package:employeeserviceapp/common/widgets/custom_bottom_app_bar.dart';
import 'package:employeeserviceapp/common/widgets/form_label.dart';
import 'package:employeeserviceapp/common/widgets/information_badge.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:employeeserviceapp/presentation/leave/widgets/leave_activity_bottom_sheet.dart';
import 'package:employeeserviceapp/presentation/leave/widgets/leave_range_info.dart';
import 'package:employeeserviceapp/presentation/leave/widgets/toggle_leave_multiple_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/custom_divider.dart';
import '../../../common/widgets/custom_form_field.dart';

class LeaveActivityPage extends StatelessWidget {
  const LeaveActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktivitas Cuti'),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InformationBadge(message: 'Silahkan pilih tipe cuti yang ingin kamu ajukan'),
                    SizedBox(height: 16.h),
                    const FormLabel(text: 'Tipe Cuti', isMandatory: true),
                    SizedBox(height: 4.h),
                    const TFormField(
                      text: 'Cuti Besar',
                      icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textDark),
                    ),
                    SizedBox(height: 16.h),
                    const TDivider(),
                    SizedBox(height: 16.h),
                    const LeaveRangeInfo(),
                    SizedBox(height: 16.h),
                    const TDivider(),
                    SizedBox(height: 16.h),
                    const InformationBadge(message: 'Untuk mengajukan cuti kamu perlu melengkapi data dibawah ini'),
                    SizedBox(height: 16.h),
                    Text(
                      'Tanggal Cuti',
                      style: AppTextStyle.heading6Medium.copyWith(color: AppColors.textDark),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FormLabel(text: 'Tanggal Mulai', isMandatory: true),
                              SizedBox(height: 4.h),
                              TFormField(
                                text: '21 Sep 2023',
                                icon: Icon(Icons.calendar_month_rounded, color: AppColors.textDark, size: 16.w),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Pilih tanggal mulai cuti",
                                style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
                              ),
                              SizedBox(height: 24.h),
                              const FormLabel(text: 'Tanggal Selesai', isMandatory: true),
                              SizedBox(height: 4.h),
                              TFormField(
                                text: '24 Sep 2023',
                                icon: Icon(Icons.calendar_month_rounded, color: AppColors.textDark, size: 16.w),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Pilih tanggal selesai cuti",
                                style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 24.w),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FormLabel(text: 'Cuti Beberapa Hari', isMandatory: false),
                              SizedBox(height: 4.h),
                              const ToggleLeaveMultipleDays(),
                              SizedBox(height: 4.h),
                              Text(
                                "Untuk cuti lebih dari 1 hari",
                                style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
                              ),
                              SizedBox(height: 24.h),
                              const FormLabel(text: 'Lama Cuti', isMandatory: false),
                              SizedBox(height: 4.h),
                              const TFormField(text: '3 Hari', fillColor: AppColors.backgroundLight),
                              SizedBox(height: 4.h),
                              Text(
                                "Jumlah lama kamu cuti",
                                style: AppTextStyle.smallRegular.copyWith(color: AppColors.textLightDark),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    const InformationBadgeWithIcon(message: 'Jika Cuti Tahunan di update maka cuti lain akan terhapus', bgColor: AppColors.info100, fgColor: AppColors.info500),
                    SizedBox(height: 64.h),
                  ],
                ),
              ),
            ),
          ),
          TBottomAppBar(
            positiveChild: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add, color: AppColors.iconWhite),
                SizedBox(width: 4.w),
                const Text("Tambahkan"),
              ],
            ),
            onPositiveClicked: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Mengontrol tinggi sesuai isi
                builder: (context) {
                  return const LeaveActivityBottomSheet();
                },
              );
            },
            negativeChild: const Text('Batal'),
            onNegativeClicked: () {
              AppNavigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
