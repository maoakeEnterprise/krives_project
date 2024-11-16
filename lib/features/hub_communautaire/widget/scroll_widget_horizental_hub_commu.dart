import 'package:flutter/material.dart';
import 'package:krives_project/features/hub_communautaire/widget/card_widget_scroll_widget_horizental.dart';

class ScrollWidgetHorizentalHubCommu extends StatelessWidget {
  const ScrollWidgetHorizentalHubCommu({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CardWidgetScrollWidgetHorizental(),
      ),
    );
  }
}
