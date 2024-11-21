import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/graphics/widget/title_widget_graphics.dart';

class TitleLeftWidget extends StatelessWidget {
  const TitleLeftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    return Row(
      children: [
        Spacer(),
        TitleWidgetGraphics(title: SourceLangage.titleGraphicsPage[2][langageChoice],
          marginTop: 10,
          marginRight: 20,
        ),
      ],
    );
  }
}
