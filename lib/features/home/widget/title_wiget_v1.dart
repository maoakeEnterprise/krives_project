import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/theme.dart';

class TitleWidgetV1 extends StatelessWidget {
  final String text;
  const TitleWidgetV1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final int chooseThemes = 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 24, 0, 0),
      child: Text(text,style: ThemeCustom.textThemes[5][chooseThemes],),
    );
  }
}
