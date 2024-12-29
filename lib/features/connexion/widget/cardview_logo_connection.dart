import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';

class CardViewLogoConnexion extends StatelessWidget{
  const CardViewLogoConnexion({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 43),
      color: ThemesColor.black,
      width: MediaQuery.sizeOf(context).width,
      constraints: BoxConstraints(
        maxHeight: 433,
      ),
    );
  }
}