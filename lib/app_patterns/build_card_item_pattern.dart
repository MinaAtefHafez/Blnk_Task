import 'dart:io';
import 'package:blnk_task/presentation/view/widgets/card_items/base_card_item.dart';
import 'package:blnk_task/presentation/view/widgets/card_items/cropped_and_image_card_item.dart';
import 'package:blnk_task/presentation/view/widgets/card_items/image_card_item.dart';
import 'package:flutter/material.dart';

abstract class CardItemPattern {
  final String text;

  CardItemPattern({required this.text});
  Widget cardItem(
      {required BuildContext context,
       Function()? croppingAndScanning,
      required Function() pick});
}

class BaseCardItem extends CardItemPattern {
  BaseCardItem({required super.text});

  @override
  Widget cardItem(
      {required BuildContext context,
       Function()? croppingAndScanning,
      required Function() pick}) {
    return CardItem(
      textButton: text,
      pick: pick,
    );
  }
}

class CardItemWithPickedImage extends CardItemPattern {
  File cardImage;
  CardItemWithPickedImage({required this.cardImage, required super.text});

  @override
  Widget cardItem(
      {required BuildContext context,
       Function()? croppingAndScanning,
      required Function() pick}) {
    return ImageCardItem(
      textButton: text,
      cardImage: cardImage,
      pick: pick,
      cropping: croppingAndScanning!,
    );
  }
}

class CardItemWithPickedAndCroppedImage extends CardItemPattern {
  File cardImage;
  File croppedImage;
  CardItemWithPickedAndCroppedImage({
    required this.cardImage,
    required this.croppedImage,
    required super.text,
  });

  @override
  Widget cardItem(
      {required BuildContext context,
       Function()? croppingAndScanning,
      required Function() pick}) {
    return CroppedAndCardItem(
      cardImage: cardImage,
      croppedImage: croppedImage,
      textButton: text,
      cropping: croppingAndScanning!,
      pick: pick,
    );
  }
}

class CardFactory {
  static CardItemPattern getCardItem({
    File? cardImage,
    File? croppedImage,
    required String text,
  }) {
    if (cardImage != null && croppedImage != null) {
      return CardItemWithPickedAndCroppedImage(
          cardImage: cardImage, croppedImage: croppedImage, text: text);
    }

    if (cardImage != null && croppedImage == null) {
      return CardItemWithPickedImage(cardImage: cardImage, text: text);
    }

    return BaseCardItem(text: text);
  }
}
