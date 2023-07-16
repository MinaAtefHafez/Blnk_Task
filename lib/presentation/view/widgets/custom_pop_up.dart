import 'package:blnk_task/core/app_colors.dart';
import 'package:blnk_task/core/app_styles.dart';
import 'package:blnk_task/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomPopUp extends StatefulWidget {
  const CustomPopUp(
      {super.key, required this.popUpSelectedItem, required this.onSelected});

  final int popUpSelectedItem;
  final Function(int val) onSelected;

  @override
  State<CustomPopUp> createState() => _CustomPopUpState();
}

class _CustomPopUpState extends State<CustomPopUp> {
  

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: AppColors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: FittedBox(
                  child: Text(AppConstants.popUpListItem[widget.popUpSelectedItem],
                      style: AppStyles.mainTextStyle
                          .copyWith(fontWeight: FontWeight.w500 , fontSize: 20 ))),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      itemBuilder: (context) {
        return List.generate(
           AppConstants.popUpListItem.length,
            (index) =>
                PopupMenuItem(value: index, child: Text( AppConstants.popUpListItem[index])));
      },
      onSelected: (int value) {
        widget.onSelected(value);
      },
    );
  }
}
