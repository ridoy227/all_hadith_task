import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:al_hadith/common/resources/font_sizes.dart';
import 'package:al_hadith/common/resources/font_style.dart';
import 'package:al_hadith/common/resources/padding_sizes.dart';
import 'package:flutter/material.dart';

class HomeIconCart extends StatelessWidget {
  final String image,title;
  const HomeIconCart({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: PaddingSizes.paddingSizeSmall),
       height: 96,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 32, width: 32,
              child: Image.asset(image,fit: BoxFit.cover,)),
          const SizedBox(height: 10,),
          Text(
            title,
            style: poppinsMedium.copyWith(
              color: AppColors.homeTopTextColor,
                fontSize: FontSizes.fontSizeSmall),
          )
        ],
      ),
    );
  }
}
