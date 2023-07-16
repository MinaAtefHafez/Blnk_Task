



import 'dart:io';

import 'package:flutter/material.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({super.key, required this.cardImage, 
  });

  final File cardImage ;
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15) ,
      child: AspectRatio(
        aspectRatio: 16 / 9 ,
        child: Image.file(cardImage)),
    );
  }
}