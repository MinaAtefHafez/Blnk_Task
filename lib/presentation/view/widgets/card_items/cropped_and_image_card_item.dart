import 'dart:io';
import 'package:blnk_task/presentation/view/widgets/custom_card_image.dart';
import 'package:blnk_task/presentation/view/widgets/custom_pick_card_image_button.dart';
import 'package:flutter/material.dart';

class CroppedAndCardItem extends StatelessWidget {
  const CroppedAndCardItem(
      {super.key,
      required this.cardImage,
      required this.croppedImage,
      required this.textButton, required this.pick, required this.cropping});

  final File cardImage;
  final File croppedImage;
  final String textButton;
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
        Row(
          children: [
            Expanded(
              child: InkWell(
                  onTap: cropping,
                  child: CustomCardImage(cardImage: cardImage)),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CustomCardImage(cardImage: croppedImage),
            ),
          ],
        ),
      ],
    );
  }
}
