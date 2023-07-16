




import 'package:blnk_task/core/app_colors.dart';
import 'package:blnk_task/core/app_styles.dart';
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, this.textInputType = TextInputType.text, 
      required this.hintText, required this.prefixWidget,  
      this.suffixIcon = const SizedBox() ,  this.maxLength = 30, 
      required this.onChanged  });

  final String hintText ;
  final TextInputType textInputType;
  final Widget prefixWidget ;
  final Widget suffixIcon ;
  final int maxLength ;
  final Function (String value) onChanged ;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      cursorColor: AppColors.black.withOpacity(0.6) ,
      maxLength: maxLength ,
      decoration: InputDecoration(
          hintText: hintText ,
          hintStyle: AppStyles.textStyle15.copyWith(
            color: AppColors.black.withOpacity(0.6) , fontWeight: FontWeight.w700  ) ,
          prefixIcon: prefixWidget ,
          suffixIcon: suffixIcon ,
          fillColor: AppColors.grey.withOpacity(0.2),
          filled: true,
          enabledBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder ,
          ),
          onChanged: onChanged ,
      validator: (val) {
        if (val!.isEmpty) {
          return 'Field must not be empty';
        }
        return null;
      },
    );
  }

  OutlineInputBorder get outlineInputBorder {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10));
  }
  
}
