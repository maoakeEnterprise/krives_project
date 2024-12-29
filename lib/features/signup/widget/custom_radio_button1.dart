import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class TestWidget extends StatelessWidget{
  const TestWidget({super.key});
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('H',style: ThemesTextStyles.textNormalWhite,),
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ThemesColor.white,
          ),
        )
      ],
    );
  }
}