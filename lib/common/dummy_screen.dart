import 'package:al_hadith/common/resources/font_sizes.dart';
import 'package:al_hadith/common/resources/font_style.dart';
import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Dummy Screen",
          style: poppinsBold.copyWith(
            fontSize: FontSizes.fontSizeLarge
          ),
        ),
      ),
    );
  }
}
