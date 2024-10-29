import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:employeeserviceapp/core/configs/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String text;
  final bool isMandatory;

  const FormLabel({
    super.key,
    required this.text,
    required this.isMandatory,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$text ',
        style: AppTextStyle.bodyRegular.copyWith(color: AppColors.textDark),
        children: [
          if (isMandatory) TextSpan(text: '*', style: AppTextStyle.bodyRegular.copyWith(color: AppColors.danger500)),
        ],
      ),
    );
  }
}
