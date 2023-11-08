import 'package:al_hadith/database_helper/database_helper.dart';
import 'package:al_hadith/modules/home/controller/home_controller.dart';
import 'package:al_hadith/modules/index/index_controller.dart';
import 'package:al_hadith/modules/topics_list/controller/topic_list_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies() async {
    Get.lazyPut(() => IndexController());
    Get.lazyPut(() => DatabaseHelper());
    Get.lazyPut(() => HomeController(databaseHelper: Get.find()) );
    Get.lazyPut(() => TopicListController(databaseHelper: Get.find()) );



  }
}
