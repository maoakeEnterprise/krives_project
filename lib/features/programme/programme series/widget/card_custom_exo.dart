import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/card_custom_exo/card_custom_exo_bloc.dart';

class CardCustomExo extends StatelessWidget {
  final int index;
  const CardCustomExo({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return GestureDetector(
      onTap: () {
        context
            .read<CardCustomExoBloc>()
            .add(CardCustomExoPressed(index: index));
      },
      child: BlocBuilder<CardCustomExoBloc, CardCustomExoState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
            width: 180,
            height: 180,
            decoration: _isSelectedCase(state, themeChoice),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                ),
                SizedBox(height: 12,),
                _textNameExo("Nom Exercice",0),
                SizedBox(height: 8,),
                _muscleUsed("Biceps",0,0),
              ],
            ),
          );
        },
      ),
    );
  }

  Text _textNameExo(String nameExo,int themeChoice){
    return Text(nameExo,
      style: ThemesTextStyles.themes[5][themeChoice],
    );
  }

  Text _muscleUsed(String nameMuscle, int langageChoice, int themeChoice){
    return Text(
      "${SourceLangage.titleSeriesPage[5][langageChoice]} : $nameMuscle",
      style: ThemesTextStyles.themes[0][themeChoice],
    );
  }

  BoxDecoration _isSelectedCase(CardCustomExoState state,int themeChoice){
    bool isSelected = false;
    if(state is CardCustomExoSelected){
      isSelected = state.index == index;
    }
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: ThemesColor.themes[0][themeChoice],
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(1, 3),
            blurRadius: 5)
      ],
      border: Border.all(
        color: isSelected ? ThemesColor.themes[4][themeChoice] : ThemesColor.themes[0][themeChoice],
        width: isSelected ? 1 : 0,
      ),
    );
  }

}
