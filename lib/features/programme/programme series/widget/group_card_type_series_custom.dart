import 'package:flutter/material.dart';
import 'package:krives_project/features/programme/programme%20series/widget/card_type_series_custom.dart';

class GroupCardTypeSeriesCustom extends StatelessWidget {
  const GroupCardTypeSeriesCustom({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    return Column(
      children: [
        CardTypeSeriesCustom(text: "normal",langageChoice: langageChoice),
        CardTypeSeriesCustom(text: "ascendante",langageChoice: langageChoice),
        CardTypeSeriesCustom(text: "descendante",langageChoice: langageChoice),
        CardTypeSeriesCustom(text: "degressive",langageChoice: langageChoice),
      ],
    );
  }
}
