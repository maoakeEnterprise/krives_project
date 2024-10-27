import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/colors_custom.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/core/data/repositories/card_custom_color2.dart';
import 'package:krives_project/features/home/widget/card_custom_home.dart';

import 'core/data/repositories/background_color_custom1.dart';
import 'core/data/datasrouces/text_styles_custom.dart';

class TestWidget extends StatelessWidget{
  const TestWidget({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ThemesColor.blackColor2,
      body: Center(
        child: CardCustomHome(),
      ),
    );
  }
}