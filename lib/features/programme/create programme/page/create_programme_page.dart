import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/repositories/card_custom_add.dart';
import 'package:krives_project/core/data/repositories/textfield_theme1.dart';
import 'package:krives_project/features/programme/create%20programme/widget/text_field_custom_program.dart';
import 'package:krives_project/features/programme/create%20programme/widget/widget_card_series.dart';

class CreateProgrammePage extends StatelessWidget {
  const CreateProgrammePage({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25,),
        Row(
          children: [
            SizedBox(width: 30,),
            TextFieldCustomProgram(labelText: "Nom du Programme"),
            SizedBox(width: 10,),
            Icon(Icons.mode_edit,size: 30,color: ThemesColor.themes[7][themeChoice],)
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              WidgetCardSeries(),
              SizedBox(height: 16,),
              CardCustomAdd(
                height: 110,
                left: 40,
                right: 40,
                labelText: SourceLangage.titleProgrammLangage[4][langageChoice],),
            ],
          ),
        ),
      ],
    );
  }
}
