import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/textfield_theme1.dart';
import 'package:krives_project/core/data/repositories/widget_scroll.dart';
import 'package:krives_project/features/create%20exercice/widget/card_muscle.dart';
import 'package:krives_project/features/create%20exercice/widget/textfield_commentary.dart';

class CreateExercisePage extends StatelessWidget {
  const CreateExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return ListView(
      padding: EdgeInsets.fromLTRB(11, 0, 0, 0),
      children: [
        SizedBox(height: 25,),
        TextFieldTheme1(labelText: SourceLangage.baseLangage[16][langageChoice],),
        SizedBox(height: 48,),
        Text(SourceLangage.baseLangage[17][langageChoice],
          style: ThemesTextStyles.themes[5][themeChoice],
        ),
        WidgetScroll(
          height: 223,
          cardCustom: CardMuscle(
            width: 180,
            height: 180,
            widthImage: 85,
            heightImage: 85,
            marginImageTop: 10,
            marginImageBottom: 10,
            marginRight: 16,
          ),
          top: 18,
          bottom: 25,
        ),
        Text(SourceLangage.baseLangage[18][langageChoice],
          style: ThemesTextStyles.themes[5][themeChoice],
        ),
        WidgetScroll(
          height: 143,
          cardCustom: CardMuscle(
            width: 100,
            height: 100,
            widthImage: 40,
            heightImage: 40,
            marginImageTop: 10,
            marginImageBottom: 18,
            marginRight: 26,
          ),
          top: 18,
          bottom: 25,
        ),
        Text(SourceLangage.baseLangage[19][langageChoice],
          style: ThemesTextStyles.themes[5][themeChoice],
        ),
        TextFieldCommentary()
      ],
    );
  }
}
