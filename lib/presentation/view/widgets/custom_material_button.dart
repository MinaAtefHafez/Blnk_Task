



import 'package:blnk_task/core/app_colors.dart';
import 'package:blnk_task/core/app_styles.dart';
import 'package:blnk_task/core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key, required this.onPressed});
  
  final Function () onPressed ;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed , 
     child: ClipRRect(
      borderRadius: BorderRadius.circular(10) ,
       child: Container(
        alignment: Alignment.center ,
        width: context.width(context) * 0.3 ,
        height: context.height(context) * 0.05 ,
           color: AppColors.deepOrange ,
           child: Text('Send' , style: AppStyles.textStyle15.copyWith(color: AppColors.white , fontSize: 20  ) ) ,
       ),
     ) ,
     ) ;
  }
}