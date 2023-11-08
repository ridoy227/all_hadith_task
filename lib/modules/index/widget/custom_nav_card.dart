import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavCard extends StatelessWidget {
  final String iconPath;
  final bool isActive;
  final Function() onTap;
  const CustomNavCard({
    super.key,
    required this.iconPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 24, width: 24,
            child: Image.asset(iconPath, color: isActive? AppColors.primaryColor: AppColors.black,),
          ),
          Container(
            height: 5,width: 28,
            decoration: BoxDecoration(
              color: isActive? AppColors.primaryColor : AppColors.white
            ),

          )
        ],
      ),
    );
  }
}
