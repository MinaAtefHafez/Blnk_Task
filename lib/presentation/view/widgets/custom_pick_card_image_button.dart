import 'package:blnk_task/core/app_colors.dart';
import 'package:blnk_task/core/app_paddings.dart';
import 'package:blnk_task/core/app_styles.dart';
import 'package:flutter/material.dart';

class CustomPickCardImageButton extends StatelessWidget {
  const CustomPickCardImageButton(
      {super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;
  

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(AppPaddings.p8),
        decoration: BoxDecoration(color: AppColors.grey.withOpacity(0.3)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: FittedBox(
                  child: Text(text,
                      style: AppStyles.textStyle15.copyWith(fontSize: 40))),
            ),
            const SizedBox(width: 5),
            Expanded(
                child: FittedBox(
                    child: Icon(icon, color: AppColors.deepOrange))),
          ],
        ),
      ),
    );
  }
}
