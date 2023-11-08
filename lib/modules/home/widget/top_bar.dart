import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:al_hadith/common/resources/assets.dart';
import 'package:al_hadith/common/resources/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBarWidget extends StatelessWidget {
  final String title;
  const TopBarWidget({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42, width: Get.width,
      padding: const EdgeInsets.symmetric(
          horizontal: 12
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 42, width: 42,
            child: Image.asset(AssetsHelper.menuIcon),
          ),
          Text(
            title,
            style: poppinsSemiBold.copyWith(fontSize: 20, color: AppColors.white),
          ),
          SizedBox(
            height: 42, width: 42,
            child: Image.asset(AssetsHelper.searchIcon),
          ),
        ],
      ),
    );
  }
}
