import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:al_hadith/common/resources/font_sizes.dart';
import 'package:al_hadith/common/resources/font_style.dart';
import 'package:al_hadith/common/resources/padding_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String title,subtitle;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: PaddingSizes.paddingSizeSmall),
      height: 65, width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.white,)
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: poppinsSemiBold.copyWith(color: AppColors.white, fontSize: FontSizes.fontSizeLarge),
                  ),
                  Text(
                   subtitle,
                    style: poppinsRegular.copyWith(color: AppColors.white, fontSize: FontSizes.fontSizeSmall),
                  ),
                ],
              ),
            ],),
          Container(
            width: 50,
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined, color: AppColors.white,)
            ),
          ),
        ],),
    );
  }
}
