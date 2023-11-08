import 'package:al_hadith/common/color_converter.dart';
import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:al_hadith/common/resources/assets.dart';
import 'package:al_hadith/common/resources/font_sizes.dart';
import 'package:al_hadith/common/resources/font_style.dart';
import 'package:al_hadith/common/resources/padding_sizes.dart';
import 'package:al_hadith/common/resources/radius_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTileWidget extends StatelessWidget {
  final String title,subTitle,totalHadith,avr,leadingColor;
  final Function() onTap;
  const CustomTileWidget({
    super.key,
    required this.title,
    required this.avr,
    required this.subTitle,
    required this.totalHadith,
    required this.leadingColor,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 68, width: Get.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(RadiusSizes.radiusDefault)
        ),
        margin: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.paddingSizeDefault,
            vertical: PaddingSizes.paddingSizeExtraSmall
        ),
        padding: const EdgeInsets.symmetric(horizontal: PaddingSizes.paddingSizeDefault),
        child: Row(
          children: [
            SizedBox(
              height: 46,width: 46,
              child: Stack(
                children: [
                  Image.asset(AssetsHelper.tile,height: 46, width: 46, color: ColorConverter().convertColor(leadingColor),),
                  Positioned(
                      child: Container(
                          height: 46,width: 46, alignment: Alignment.center,
                          child: Text(
                           avr,
                            style: poppinsMedium.copyWith(fontSize: FontSizes.fontSizeExtraLarge, color: AppColors.white),
                          )
                      )
                  )
                ],
              ),
            ),

            const SizedBox(width: PaddingSizes.paddingSizeSmall,),


            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: poppinsSemiBold.copyWith(fontSize: FontSizes.fontSizeDefault, color: AppColors.black),
                    ),
                    Text(
                     totalHadith,
                      style: poppinsSemiBold.copyWith(fontSize: FontSizes.fontSizeDefault, color: AppColors.black),
                    ),
                  ],
                ),
                // const  SizedBox(height: PaddingSizes.paddingSizeExtraSmall,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     subTitle,
                      style: poppinsRegular.copyWith(fontSize: FontSizes.fontSizeSmall, color: AppColors.homeTopTextColor),
                    ),
                    Text(
                      "Hadith",
                      style: poppinsRegular.copyWith(fontSize: FontSizes.fontSizeSmall, color: AppColors.homeTopTextColor),
                    ),
                  ],
                )

              ],
            ))
          ],
        ),

      ),
    );
  }
}
