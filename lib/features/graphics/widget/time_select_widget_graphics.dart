import 'package:flutter/material.dart';
import 'package:krives_project/features/graphics/widget/button_time_widget_graphics.dart';

class TimeSelectWidgetGraphics extends StatelessWidget {
  const TimeSelectWidgetGraphics({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonTimeWidgetGraphics(text: "Mois"),
        ButtonTimeWidgetGraphics(text: "Semaines"),
        ButtonTimeWidgetGraphics(text: "Années"),
        ButtonTimeWidgetGraphics(text: "Jours"),
      ],
    );
  }
}

