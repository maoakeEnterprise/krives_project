import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/textfield_theme1.dart';
import 'package:krives_project/core/data/repositories/widget_scroll.dart';
import 'package:krives_project/features/exercice/create%20exercice/widget/card_main_muscle.dart';
import 'package:krives_project/features/exercice/create%20exercice/widget/textfield_commentary.dart';
import 'package:krives_project/features/exercice/create%20exercice/widget/widget_scroll_main_muscle.dart';
import 'package:krives_project/features/exercice/create%20exercice/widget/widget_scroll_secondary_muscle.dart';

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
        WidgetScrollMainMuscle(),
        Text(SourceLangage.baseLangage[18][langageChoice],
          style: ThemesTextStyles.themes[5][themeChoice],
        ),
        WidgetScrollSecondaryMuscle(),
        Text(SourceLangage.baseLangage[19][langageChoice],
          style: ThemesTextStyles.themes[5][themeChoice],
        ),
        TextFieldCommentary()
      ],
    );
  }
}
