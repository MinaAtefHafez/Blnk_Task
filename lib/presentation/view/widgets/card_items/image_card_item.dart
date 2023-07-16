import 'dart:io';

import 'package:blnk_task/core/app_colors.dart';
import 'package:blnk_task/core/app_styles.dart';
import 'package:blnk_task/presentation/view/widgets/custom_card_image.dart';
import 'package:blnk_task/presentation/view/widgets/custom_pick_card_image_button.dart';
import 'package:flutter/material.dart';

class ImageCardItem extends StatelessWidget {
  const ImageCardItem(
      {super.key, required this.textButton, required this.cardImage, required this.pick,
       required this.cropping});

  final String textButton;
  final File cardImage;
  final Function () pick ;
  final Function () cropping ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: pick ,
          child: CustomPickCardImageButton(
            text: textButton,
            icon: Icons.card_giftcard,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: cropping ,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomCardImage(cardImage: cardImage),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        color: AppColors.white,
                        child: const Icon(
                          Icons.cut,
                          color: AppColors.deepOrange,
                        )),
                  ),
                  FittedBox(
                    child: Text(
                      'click to cropped Card ID',
                      style: AppStyles.textStyle15.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
