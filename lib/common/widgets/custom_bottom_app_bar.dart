import 'package:employeeserviceapp/core/configs/theme/app_button_style.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TBottomAppBar extends StatelessWidget {
  final Widget positiveChild;
  final Widget? negativeChild;
  final void Function() onPositiveClicked;
  final void Function()? onNegativeClicked;

  const TBottomAppBar({
    super.key,
    required this.onPositiveClicked,
    this.onNegativeClicked,
    required this.positiveChild,
    this.negativeChild,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
            )
          ],
        ),
        child: Row(
          children: [
            if (negativeChild != null)
              Expanded(
                child: ElevatedButton(
                  onPressed: onNegativeClicked,
                  style: AppButtonStyle.filledAlt,
                  child: negativeChild,
                ),
              ),
            if (negativeChild != null) const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: onPositiveClicked,
                style: AppButtonStyle.filledInfo,
                child: positiveChild,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
