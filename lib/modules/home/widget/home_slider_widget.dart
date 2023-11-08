import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:al_hadith/common/resources/font_sizes.dart';
import 'package:al_hadith/common/resources/font_style.dart';
import 'package:al_hadith/common/resources/padding_sizes.dart';
import 'package:al_hadith/data/slider_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSliderWidget extends StatelessWidget {
   HomeSliderWidget({super.key});
  final List<SliderModel> sliderText = [
    SliderModel(
        title: "Bukhari and Muslim",
        descriptions: "“A slave [of Allah] may utter a word without giving it much thought by which he slips into the fire a distance further than that between east and west.”"
    ),
    SliderModel(
        title: "Bukhari and Muslim",
        descriptions: "“There are two words which are light on the tongue, heavy on the scale, and loved by the Most Merciful: SubhanAllahi wa bihamdi, SubhanAllahi al-azem.”"
    ),
    SliderModel(
        title: "Bukhari",
        descriptions: "The angels continue to pray for one of you as long as he remains in his place of prayer provided he does not break his ablution. The angels say, “O Allah! Forgive him. O Allah! Have mercy on him.“"
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: sliderText.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: PaddingSizes.paddingSizeDefault),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  e.descriptions,
                  textAlign: TextAlign.center,
                  style: hindSiliguriMedium.copyWith(fontSize: FontSizes.fontSizeDefault, color: AppColors.white),
                ),
                Text(
                  "[ ${e.title} ]",
                  style: hindSiliguriMedium.copyWith(fontSize: FontSizes.fontSizeDefault, color: AppColors.white),
                ),
              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true
        )
    );
  }
}
