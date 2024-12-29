import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/card_type_series/card_type_series_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/widget/text_field_custom_during_series.dart';

class CardDuringSerieCustom extends StatelessWidget {
  const CardDuringSerieCustom({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
      decoration: BoxDecoration(
          color: ThemesColor.themes[0][themeChoice],
          borderRadius: BorderRadius.circular(5)
      ),
      child: BlocBuilder<CardTypeSeriesBloc, CardTypeSeriesState>(
        builder: (context, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Text(SourceLangage.titleSeriesPage[12][langageChoice], style: ThemesTextStyles.themes[6][themeChoice],),
                SizedBox(height: 9,),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text(SourceLangage.titleSeriesPage[9][langageChoice],
                            style: ThemesTextStyles.themes[3][themeChoice],),
                        ],
                      ),
                      TextFieldCustomDuringSeries(),
                    ]),

                SizedBox(height: 9,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text(SourceLangage.titleSeriesPage[10][langageChoice],
                          style: ThemesTextStyles.themes[3][themeChoice],),
                      ],
                    ),
                    TextFieldCustomDuringSeries(),
                  ],
                ),
                typeSerie(context, state, langageChoice, themeChoice),
              ]);
        },
      ),
    );
  }
  Column typeSerie(BuildContext context, CardTypeSeriesState state,int langageChoice, int themeChoice){
    if(state is CardTypeSeriesSelected){
      if(state.numberSelected == "descendante" || state.numberSelected =="ascendante"){
        return Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text(SourceLangage.titleSeriesPage[13][langageChoice],
                      style: ThemesTextStyles.themes[3][themeChoice],),
                  ],
                ),
                TextFieldCustomDuringSeries(),
              ],
            ),
            SizedBox(height: 9,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text(SourceLangage.titleSeriesPage[14][langageChoice],
                      style: ThemesTextStyles.themes[3][themeChoice],),
                  ],
                ),
                TextFieldCustomDuringSeries(),
              ],
            ),
          ],
        );
      }
    }
    return Column();
  }
}
