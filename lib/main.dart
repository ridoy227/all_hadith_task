import 'package:al_hadith/bindings.dart';
import 'package:al_hadith/modules/home/home_screen.dart';
import 'package:al_hadith/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Al Hadith',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialBinding: GlobalBindings(),
      initialRoute: AppPages.goToIndexPage(),
      home: const HomeScreen(),
    );
  }
}
