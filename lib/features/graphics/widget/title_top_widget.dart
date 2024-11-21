import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/graphics/widget/title_widget_graphics.dart';

class TitleTopWidget extends StatelessWidget {
  const TitleTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    return Row(
      children: [
        TitleWidgetGraphics(title: SourceLangage.titleGraphicsPage[0][langageChoice],
          marginTop: 33,
          marginLeft: 16,
        )
      ],
    );
  }
}
