import 'package:al_hadith/common/dummy_screen.dart';
import 'package:al_hadith/modules/home/home_screen.dart';
import 'package:get/get.dart';

class IndexController extends GetxController implements GetxService {
  int index = 0;
  final List pages = [
    const HomeScreen(),
    const DummyScreen(),
    const DummyScreen(),
    const DummyScreen(),
    const DummyScreen(),
  ];


  void updateIndex({required int selectedIndex}){
    index = selectedIndex;
    update();
  }

}