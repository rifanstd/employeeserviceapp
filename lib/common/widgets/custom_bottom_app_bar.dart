import 'package:employeeserviceapp/core/configs/theme/app_button_style.dart';
import 'package:employeeserviceapp/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TBottomAppBar extends StatelessWidget {
  final String titlePositiveBtn;
  final String? titleNegativeBtn;
  final void Function() onPositiveClicked;
  final void Function()? onNegativeClicked;

  const TBottomAppBar({
    super.key,
    required this.titlePositiveBtn,
    required this.onPositiveClicked,
    this.titleNegativeBtn,
    this.onNegativeClicked,
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
            if (titleNegativeBtn != null)
              Expanded(
                child: ElevatedButton(
                  onPressed: onNegativeClicked,
                  style: AppButtonStyle.filledAlt,
                  child: Text(titleNegativeBtn!),
                ),
              ),
            if (titleNegativeBtn != null) const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: AppButtonStyle.filledInfo,
                child: const Text("Buat Form Leave"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
