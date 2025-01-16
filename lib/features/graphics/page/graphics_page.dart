import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/widget_scroll.dart';
import 'package:krives_project/features/graphics/widget/card_exo_widget_graphics.dart';
import 'package:krives_project/features/graphics/widget/graph_widget.dart';
import 'package:krives_project/features/graphics/widget/time_select_widget_graphics.dart';
import 'package:krives_project/features/graphics/widget/title_left_widget.dart';
import 'package:krives_project/features/graphics/widget/title_top_widget.dart';
import 'package:krives_project/features/graphics/widget/title_widget_graphics.dart';

class GraphicsPage extends StatelessWidget {
  const GraphicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //int themeChoice = 0;
    int langageChoice = 0;
    return ListView(
      children: [
        TitleTopWidget(),
        GraphWidget(),
        TitleLeftWidget(),
        SizedBox(height: 15,),
        WidgetScroll(height: 200, cardCustom: CardExoWidgetGraphics()),
        TitleWidgetGraphics(title: SourceLangage.titleGraphicsPage[3][langageChoice],
          marginLeft: 26,
          marginTop: 15,
        ),
        SizedBox(height: 14,),
        TimeSelectWidgetGraphics(),
      ],
    );
  }
}
