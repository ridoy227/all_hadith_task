import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:al_hadith/common/resources/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardBG extends StatelessWidget {
  const DashboardBG({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                gradient: LinearGradient(
                  colors: [
                    AppColors.homeGradientTop,
                    AppColors.homeGradientBottom,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
            height: Get.height/2.2,
            width: Get.width,
            alignment: Alignment.bottomCenter,
            child: Image.asset(AssetsHelper.dashBoardBG),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
