import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/create_series_bloc/create_series_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/services/service_series.dart';
import 'package:krives_project/features/programme/programme%20series/widget/text_field_custom_during_series.dart';

class CardDuringSerieCustom extends StatelessWidget {
  final TextEditingController controllerCharge;
  final TextEditingController controllerRepeat;
  final TextEditingController controllerDiffCharge;
  final TextEditingController controllerDiffRepeat;
  const CardDuringSerieCustom({
    super.key,
    required this.controllerCharge,
    required this.controllerRepeat,
    required this.controllerDiffCharge,
    required this.controllerDiffRepeat,
  });

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
      child: BlocBuilder<CreateSeriesBloc, CreateSeriesState>(
        builder: (context, state) {
          controllerCharge.text = ServiceSeries.getTextFieldDataSeries(state, "charge");
          controllerRepeat.text = ServiceSeries.getTextFieldDataSeries(state, "repeat");
          controllerDiffCharge.text = ServiceSeries.getTextFieldDataSeries(state, "diffCharge");
          controllerDiffRepeat.text = ServiceSeries.getTextFieldDataSeries(state, "diffRepeat");
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
                      TextFieldCustomDuringSeries(controller: controllerCharge,textDefinitionTextField: "charge",),
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
                    TextFieldCustomDuringSeries(controller: controllerRepeat,textDefinitionTextField: "repeat",),
                  ],
                ),
                typeSerie(context, state, langageChoice, themeChoice),
              ]);
        },
      ),
    );
  }
  Column typeSerie(BuildContext context, CreateSeriesState state,int langageChoice, int themeChoice){
    if(state is CreateSeriesLoaded){
      if(["ascendante","descendante"].contains(state.series.typeSeries)){
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
                TextFieldCustomDuringSeries(controller: controllerDiffCharge,textDefinitionTextField: "diffCharge",),
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
                TextFieldCustomDuringSeries(controller: controllerDiffRepeat,textDefinitionTextField: "diffRepeat",),
              ],
            ),
          ],
        );
      }
    }
    return Column();
  }
}
