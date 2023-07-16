import 'package:blnk_task/presentation/view/widgets/custom_pick_card_image_button.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.textButton, required this.pick});

  final String textButton;
  final Function () pick ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: pick ,
          child: CustomPickCardImageButton(
              text: textButton, icon: Icons.card_giftcard),
        ),
      ],
    );
  }
}
