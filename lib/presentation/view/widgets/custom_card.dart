import 'package:blnk_task/app_patterns/build_card_item_pattern.dart';
import 'package:blnk_task/presentation/cubits/user_data_cubit.dart';

import 'package:flutter/material.dart';

class CustomIdCard extends StatefulWidget {
  const CustomIdCard({super.key});

  @override
  State<CustomIdCard> createState() => _CustomIdCardState();
}

class _CustomIdCardState extends State<CustomIdCard> {
  @override
  Widget build(BuildContext context) {
    var userCubit = UserDataCubit.cubit(context);
    CardItemPattern frontCardItem = CardFactory.getCardItem(
        text: 'pick front card',
        cardImage: userCubit.frontCard,
        croppedImage: userCubit.croppedFrontCard);
    CardItemPattern backCardItem = CardFactory.getCardItem(
        text: 'pick back card',
        cardImage: userCubit.backCard,
        croppedImage: userCubit.croppedBackCard);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: frontCardItem.cardItem(
          context: context,
          pick: () async {
            await userCubit.pickFrontCardImage();
            setState(() {});
          },
          croppingAndScanning: () async {
            await userCubit.croppedFrontCartImage(
                context: context, frontCardPath: userCubit.frontCard!.path);
            setState(() {});
            await userCubit.scanFrontCardId(
                imagePath: userCubit.croppedFrontCard!.path);
                
          },
        )),
        const SizedBox(width: 10),
        Expanded(
            child: backCardItem.cardItem(
          context: context,
          pick: () async {
            await userCubit.pickBackCardImage();
            setState(() {});
          },
          croppingAndScanning: () async {
            await userCubit.croppedBackCartImage(
                context: context, backCardPath: userCubit.backCard!.path);
            setState(() {});
            await userCubit.scanBackCardId(
                imagePath: userCubit.croppedBackCard!.path);
                
                
          },
        )),
      ],
    );
  }
}
