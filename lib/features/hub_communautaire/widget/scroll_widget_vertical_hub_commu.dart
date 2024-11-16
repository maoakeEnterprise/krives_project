import 'package:flutter/material.dart';
import 'package:krives_project/features/hub_communautaire/widget/card_widget_scroll_widget_vertical_hub_commu.dart';

class ScrollWidgetVerticalHubCommu extends StatelessWidget {
  const ScrollWidgetVerticalHubCommu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => CardWidgetScrollWidgetVerticalHubCommu(),
      ),
    );
  }
}
