import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/popup_filters/page/pop_up_filter.dart';

class ButtonWidgetFilters extends StatelessWidget {
  const ButtonWidgetFilters({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: IconButton(
        onPressed: (){
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context){
                return PopUpFilter();
              }
          );
        },
        icon: Icon(Icons.more_vert),
        color: ThemesColor.themes[7][themeChoice],
      ),
    );
  }
}
