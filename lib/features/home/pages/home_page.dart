import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/home/widget/card_custom_home.dart';
import 'package:krives_project/core/data/repositories/widget_scroll.dart';
import 'package:krives_project/features/home/widget/title_widget_v2.dart';
import 'package:krives_project/features/home/widget/title_wiget_v1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int chooseThemes = 0;
  final int chooseLangage = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TitleWidgetV2(
            text: SourceLangage.titleHomePagesLangage[0][chooseLangage],
            icon: Icons.mode_edit_outline_outlined
        ),
        WidgetScroll(cardCustom: CardCustomHome(),height: 214, itemCount: 4, left: 10, top: 10, right: 10, bottom: 24,),
        TitleWidgetV1(text:SourceLangage.titleHomePagesLangage[1][chooseLangage]),
        WidgetScroll(cardCustom: CardCustomHome(),height: 214, itemCount: 3, left: 10, top: 10, right: 10, bottom: 24,),
        TitleWidgetV1(text:SourceLangage.titleHomePagesLangage[2][chooseLangage]),
        WidgetScroll(cardCustom: CardCustomHome(),height: 214, itemCount: 9, left: 10, top: 10, right: 10, bottom: 24,),
      ],
    );
  }
}
