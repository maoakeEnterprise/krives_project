import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/programme/create%20programme/bloc/edit_bloc.dart';

class WidgetCardSeries extends StatelessWidget {
  final VoidCallback onTap;
  const WidgetCardSeries({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return CardCustomColor1(
      left: 41,
      right: 41,
      top: 36,
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "My Exo name",
                style: ThemesTextStyles.themes[5][themeChoice],
              ),
              Text(
                "${SourceLangage.titleProgrammLangage[0][langageChoice]}: 30",
                style: ThemesTextStyles.themes[0][themeChoice],
              ),
              Text(
                "${SourceLangage.titleProgrammLangage[1][langageChoice]}: 10",
                style: ThemesTextStyles.themes[0][themeChoice],
              ),
              Text(
                "${SourceLangage.titleProgrammLangage[2][langageChoice]}: My cock",
                style: ThemesTextStyles.themes[0][themeChoice],
              ),
              Text(
                "${SourceLangage.titleProgrammLangage[3][langageChoice]}: 15kg",
                style: ThemesTextStyles.themes[0][themeChoice],
              ),
            ],
          ),
          BlocBuilder<EditBloc, EditState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: _isOnTapSettingsOrDelete(state,context),
                child: Container(
                  margin: EdgeInsets.fromLTRB(60, 20, 0, 0),
                  child: Icon(
                    _isIconSettingsOrDelete(state),
                    color: ThemesColor.themes[7][themeChoice],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  IconData _isIconSettingsOrDelete(EditState state){
    return state is EditIconNormal ? Icons.settings : Icons.delete;
  }
  VoidCallback _isOnTapSettingsOrDelete(EditState state, BuildContext context){
    return state is EditIconNormal ? onTap : (){onTapDelete(context);};
  }
  
  void onTapDelete(BuildContext context){

  }
}
