import 'package:al_hadith/modules/home/home_screen.dart';
import 'package:al_hadith/modules/index/index.dart';
import 'package:al_hadith/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  const AppPages._();

  static goToIndexPage() => Paths.index;
  static goToHomePage() => Paths.home;

  static final routes = [
    GetPage(
      name: Paths.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Paths.index,
      page: () =>  const IndexScreen(),
    ),
  ];
}

