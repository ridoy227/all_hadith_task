import 'package:al_hadith/common/resources/app_colors.dart';
import 'package:al_hadith/common/resources/assets.dart';
import 'package:al_hadith/common/resources/font_sizes.dart';
import 'package:al_hadith/common/resources/font_style.dart';
import 'package:al_hadith/common/resources/padding_sizes.dart';
import 'package:al_hadith/common/resources/radius_sizes.dart';
import 'package:al_hadith/modules/topics_list/controller/topic_list_controller.dart';
import 'package:al_hadith/modules/topics_list/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicListScreen extends StatefulWidget {
  final String bookName,totalHadith,title;
  const TopicListScreen({
    super.key,
    required this.bookName,
    required this.title,
    required this.totalHadith,
  });

  @override
  State<TopicListScreen> createState() => _TopicListScreenState();
}

class _TopicListScreenState extends State<TopicListScreen> {
  TopicListController topicListController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topicListController.getChapterByBookName(widget.bookName);
    topicListController.searchController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          const SizedBox(height: 40,),
           CustomAppBar(title: widget.title, subtitle: "${widget.totalHadith} Hadith"),
          Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(RadiusSizes.radiusLarge), topRight: Radius.circular(RadiusSizes.radiusLarge))
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50, width: Get.width,
                      margin: const EdgeInsets.symmetric(horizontal: PaddingSizes.paddingSizeDefault, vertical: PaddingSizes.paddingSizeDefault),
                      padding: const EdgeInsets.only(left: PaddingSizes.paddingSizeDefault),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(RadiusSizes.radiusDefault), color: AppColors.white),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: topicListController.searchController,
                        onChanged: (value){
                          topicListController.searchChapter(value);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Image.asset(AssetsHelper.searchIcon, color: AppColors.homeTopTextColor, fit: BoxFit.cover,),
                          hintText: "Search Chapter",
                          hintStyle: poppinsRegular.copyWith(fontSize: FontSizes.fontSizeDefault, color: AppColors.homeTopTextColor),
                        ),
                      ) ,
                    ),
                    Flexible(
                      child: GetBuilder<TopicListController>(
                        builder: (topicListController) {
                          return  topicListController.searchController.text.isNotEmpty && topicListController.filterData.isEmpty? Center(
                            child: Text("No Search Result Found",
                            style: poppinsBold.copyWith(fontSize: FontSizes.fontSizeLarge),
                            ),
                          ) : topicListController.filterData.isEmpty?
                          ListView.builder(
                              shrinkWrap: true, physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: topicListController.chapterList.length,
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(RadiusSizes.radiusDefault),),
                                margin: const EdgeInsets.symmetric(vertical: PaddingSizes.paddingSizeExtraSmall, horizontal: PaddingSizes.paddingSizeDefault),
                                child: ListTile(
                                  title: Text(
                                    topicListController.chapterList[index].title,
                                    style: poppinsSemiBold.copyWith(fontSize: FontSizes.fontSizeDefault, color: AppColors.homeTopTextColor),
                                  ),
                                  subtitle: Text(
                                    "Hadith Range : ${topicListController.chapterList[index].range}",
                                    style: poppinsRegular.copyWith(fontSize: FontSizes.fontSizeSmall, color: AppColors.homeTopTextColor),
                                  ),
                                  leading: Container(
                                    height: 42, width: 42, alignment: Alignment.center,
                                    decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                                    child: Text(
                                      (index+1).toString(),
                                      style: poppinsSemiBold.copyWith(fontSize: FontSizes.fontSizeLarge, color: AppColors.white),
                                    ),
                                  ),

                                ),
                              )
                          ) : ListView.builder(
                              shrinkWrap: true, physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: topicListController.filterData.length,
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(RadiusSizes.radiusDefault),),
                                margin: const EdgeInsets.symmetric(vertical: PaddingSizes.paddingSizeExtraSmall, horizontal: PaddingSizes.paddingSizeDefault),
                                child: ListTile(
                                  title: Text(
                                    topicListController.filterData[index].title,
                                    style: poppinsSemiBold.copyWith(fontSize: FontSizes.fontSizeDefault, color: AppColors.homeTopTextColor),
                                  ),
                                  subtitle: Text(
                                    "Hadith Range : ${topicListController.filterData[index].range}",
                                    style: poppinsRegular.copyWith(fontSize: FontSizes.fontSizeSmall, color: AppColors.homeTopTextColor),
                                  ),
                                  leading: Container(
                                    height: 42, width: 42, alignment: Alignment.center,
                                    decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                                    child: Text(
                                      (index+1).toString(),
                                      style: poppinsSemiBold.copyWith(fontSize: FontSizes.fontSizeLarge, color: AppColors.white),
                                    ),
                                  ),

                                ),
                              )
                          );
                        }
                      ),
                    ),

                    const SizedBox(height: PaddingSizes.paddingSizeDefault,)








                  ],
                ),
              ))




        ],
      ),
    );
  }
}
