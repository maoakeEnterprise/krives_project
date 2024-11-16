import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/hub_communautaire/widget/button_widget_filters.dart';
import 'package:krives_project/features/hub_communautaire/widget/text_field_hub_commu_widget.dart';

class SearchFieldZoneWidget extends StatelessWidget {
  const SearchFieldZoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    return Row(
      children: [
        TextFieldHubCommuWidget(labelText: SourceLangage.baseLangage[20][langageChoice],),
        ButtonWidgetFilters(),
      ],
    );
  }
}
