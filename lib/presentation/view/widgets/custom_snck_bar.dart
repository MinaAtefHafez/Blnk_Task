






   import 'package:blnk_task/core/app_colors.dart';
import 'package:blnk_task/core/app_paddings.dart';
import 'package:blnk_task/core/app_styles.dart';
import 'package:flutter/material.dart';

void showSnackBar ({ required BuildContext context ,required String content , Color backgroundColor = AppColors.red }) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(content , style: AppStyles.textStyle15.copyWith(fontSize: 13 ) , ) , 
           padding: const EdgeInsets.all(AppPaddings.p5),
           backgroundColor: backgroundColor,
           shape: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15), 
             borderSide: BorderSide.none  
           ) ,
          ),
      );
   }