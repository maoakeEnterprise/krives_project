import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/colors_custom.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/core/data/repositories/card_custom_color2.dart';
import 'package:krives_project/features/home/widget/card_custom_home.dart';
import 'package:krives_project/core/data/repositories/widget_scroll.dart';

import 'core/data/repositories/background_color_custom1.dart';
import 'core/data/datasrouces/text_styles_custom.dart';

class TestWidget extends StatefulWidget{
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ThemesColor.blackColor2,
      body: Center(

      ),
    );
  }
}