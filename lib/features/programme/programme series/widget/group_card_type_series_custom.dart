import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/programme/programme%20series/widget/card_type_series_custom.dart';

class GroupCardTypeSeriesCustom extends StatelessWidget {
  const GroupCardTypeSeriesCustom({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    return Column(
      children: [
        CardTypeSeriesCustom(text: SourceLangage.titleSeriesPage[6][langageChoice],),
        CardTypeSeriesCustom(text: SourceLangage.titleSeriesPage[7][langageChoice],),
        CardTypeSeriesCustom(text: SourceLangage.titleSeriesPage[8][langageChoice],),
      ],
    );
  }
}
