import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/hub_communautaire/widget/scroll_widget_horizental_hub_commu.dart';
import 'package:krives_project/features/hub_communautaire/widget/scroll_widget_vertical_hub_commu.dart';
import 'package:krives_project/features/hub_communautaire/widget/search_field_zone_widget.dart';

class HubCommunautairePage extends StatelessWidget {
  const HubCommunautairePage({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 7,),
        SearchFieldZoneWidget(),
        SizedBox(height: 20,),
        ScrollWidgetVerticalHubCommu(),
        Container(
            margin: EdgeInsets.fromLTRB(27, 0, 0, 0),
            child: Text(SourceLangage.titleHomePagesLangage[2][langageChoice],
              style: ThemesTextStyles.themes[5][themeChoice],
            ),
        ),
        ScrollWidgetHorizentalHubCommu(),
      ],
    );
  }
}
