import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:al_hadith/common/resources/assets.dart';
import 'package:al_hadith/common/resources/font_sizes.dart';
import 'package:al_hadith/common/resources/font_style.dart';
import 'package:al_hadith/common/resources/padding_sizes.dart';
import 'package:al_hadith/common/resources/radius_sizes.dart';
import 'package:al_hadith/database_helper/database_helper.dart';
import 'package:al_hadith/modules/home/controller/home_controller.dart';
import 'package:al_hadith/modules/home/widget/custom_tile_widget.dart';
import 'package:al_hadith/modules/home/widget/dashboard_bg.dart';
import 'package:al_hadith/modules/home/widget/home_icon_cart.dart';
import 'package:al_hadith/modules/home/widget/home_slider_widget.dart';
import 'package:al_hadith/modules/home/widget/top_bar.dart';
import 'package:al_hadith/modules/topics_list/topics_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DatabaseHelper databaseHelper = Get.find();
  HomeController homeController = Get.find();





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getBookData();

  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(color: AppColors.homeGradientTop.withOpacity(0.99), height: 40),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: (Get.height/2.2)+40,
                  child: Stack(
                    children: [
                      const DashboardBG(),
                      const Positioned(top: 10, child: TopBarWidget(title:  "Al Hadith",)),
                      Positioned(top: 100, child: SizedBox(
                        height: 125, width: Get.width,
                        child: HomeSliderWidget(),
                      )
                      ),
                      Positioned(
                          bottom: 0, right: 0,left: 0,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: PaddingSizes.paddingSizeLarge),
                            padding: const EdgeInsets.symmetric(horizontal: PaddingSizes.paddingSizeExtraLarge+5),
                            width: Get.width, height: 100,
                            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(RadiusSizes.radiusLarge)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeIconCart(image: AssetsHelper.last, title: "Last"),
                                HomeIconCart(image: AssetsHelper.goto, title: "Go To"),
                                HomeIconCart(image: AssetsHelper.apps, title: "Apps"),
                                HomeIconCart(image: AssetsHelper.sadaqa, title: "Sadaqa"),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.only(left: PaddingSizes.paddingSizeDefault), alignment: Alignment.centerLeft,
                  child: Text(
                    "All Hadith Book",
                    style: poppinsSemiBold.copyWith(fontSize: FontSizes.fontSizeDefault, color: AppColors.black,),
                  ),
                ),
                const SizedBox(height: PaddingSizes.paddingSizeDefault,),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.bookList.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index) {


                        return CustomTileWidget(
                          onTap: () => Get.to(
                              TopicListScreen(
                                title: controller.bookList[index].title ,
                                bookName: controller.bookList[index].bookName,
                                totalHadith: controller.bookList[index].totalHadith,
                              ),
                              transition: Transition.rightToLeft
                          ),
                          leadingColor: controller.bookList[index].color,
                          title: controller.bookList[index].title,
                          subTitle: controller.bookList[index].bookName,
                          totalHadith: controller.bookList[index].totalHadith,
                          avr:  controller.bookList[index].avbrCode,
                        );
                        }
                    );
                  }
                ),

                const SizedBox(height: 10,),





              ],
            ),
          ),
        ],
      )
    );
  }
}
