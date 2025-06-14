import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/programme/create%20programme/bloc/edit_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/services/service_series.dart';

class WidgetCardSeries extends StatelessWidget {
  final VoidCallback onTap;
  final Series serie;
  final Exercise exercise;
  final Program program;
  const WidgetCardSeries({
    required this.exercise,
    required this.onTap,
    required this.serie,
    required this.program,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return CardCustomColor1(
      left: 41,
      right: 41,
      bottom: 12,
      width: 0,
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 10, 0),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Image.asset(exercise.mainMuscle.imageMuscle),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                exercise.name,
                style: ThemesTextStyles.themes[5][themeChoice],
              ),
              Text(
                "${SourceLangage.titleProgrammLangage[0][langageChoice]}: ${serie.numberSeries}",
                style: ThemesTextStyles.themes[0][themeChoice],
              ),
              Text(
                "${SourceLangage.titleProgrammLangage[1][langageChoice]}: ${serie.numberRep}",
                style: ThemesTextStyles.themes[0][themeChoice],
              ),
              Text(
                "${SourceLangage.titleProgrammLangage[2][langageChoice]}: ${exercise.mainMuscle.nameMuscle[langageChoice]}",
                style: ThemesTextStyles.themes[0][themeChoice],
              ),
              Text(
                "${SourceLangage.titleProgrammLangage[3][langageChoice]}: ${serie.maxKG}",
                style: ThemesTextStyles.themes[0][themeChoice],
              ),
            ],
          ),
          Spacer(),
          BlocBuilder<EditBloc, EditState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: ServiceSeries.theRightActionIsSettingOrDeletingSeries(state,context,onTap,serie,program),
                child: Container(
                  margin: EdgeInsets.fromLTRB(60, 20, 0, 0),
                  child: Icon(
                    ServiceSeries.isIconSettingsOrDeleting(state),
                    color: ThemesColor.themes[7][themeChoice],
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}
