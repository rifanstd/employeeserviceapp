import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/configs/theme/app_button_style.dart';
import '../../core/configs/theme/app_colors.dart';
import '../../core/configs/theme/app_text_style.dart';

class ConfirmationAlertDialog extends StatelessWidget {
  final String iconPath;
  final String title;
  final String text;
  final void Function() onConfirm;

  const ConfirmationAlertDialog({
    super.key,
    required this.iconPath,
    required this.title,
    required this.text,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundWhite,
      surfaceTintColor: AppColors.backgroundWhite,
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 297.w,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(30).r,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 100.w,
              height: 100.w,
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: AppTextStyle.heading5Bold.copyWith(color: AppColors.textDark),
            ),
            SizedBox(height: 16.h),
            Text(
              text,
              style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onConfirm,
                style: AppButtonStyle.filledInfo,
                child: const Text('Tutup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
