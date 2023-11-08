import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:al_hadith/common/resources/assets.dart';
import 'package:al_hadith/common/resources/padding_sizes.dart';
import 'package:al_hadith/common/resources/radius_sizes.dart';
import 'package:al_hadith/modules/index/index_controller.dart';
import 'package:al_hadith/modules/index/widget/custom_nav_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexScreen extends StatelessWidget {
   const IndexScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return  GetBuilder<IndexController>(
        builder: (indexController) {
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          body: indexController.pages[indexController.index],
          bottomNavigationBar: Container(
            height: 56, width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal:  PaddingSizes.paddingSizeSmall,),
            decoration: BoxDecoration( color: AppColors.white,
              borderRadius: BorderRadius.circular(RadiusSizes.radiusDefault),
              boxShadow: [
                BoxShadow(
                  color: AppColors.boxShadowColor.withOpacity(0.15),
                  blurRadius: 20, spreadRadius: 0.5
                )
              ]
            ),
            padding: const EdgeInsets.only( top: 15,
              left: PaddingSizes.paddingSizeExtraLarge,
              right: PaddingSizes.paddingSizeExtraLarge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomNavCard(
                  iconPath: AssetsHelper.home,
                  isActive:  indexController.index == 0? true:false ,
                  onTap: () => indexController.updateIndex(selectedIndex: 0),
                ),
                CustomNavCard(
                  iconPath: AssetsHelper.book,
                  isActive: indexController.index == 1? true:false ,
                  onTap: () => indexController.updateIndex(selectedIndex: 1),
                ),
                CustomNavCard(
                  iconPath: AssetsHelper.note,
                  isActive: indexController.index == 2? true:false ,
                  onTap: () => indexController.updateIndex(selectedIndex: 2),
                ),
                CustomNavCard(
                  iconPath: AssetsHelper.save,
                  isActive: indexController.index == 3? true:false,
                  onTap: () => indexController.updateIndex(selectedIndex: 3),
                ),
                CustomNavCard(
                  iconPath: AssetsHelper.profile,
                  isActive: indexController.index == 4? true:false ,
                  onTap: () => indexController.updateIndex(selectedIndex: 4),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
