import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/create_series_bloc/create_series_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/services/service_series.dart';

class CardTypeSeriesCustom extends StatelessWidget {
  final String text;
  final int langageChoice;

  const CardTypeSeriesCustom({
    super.key,
    required this.text,
    required this.langageChoice,
  });

  @override
  Widget build(BuildContext context) {

    Map<String, String> mapTitle = {
      "normal": SourceLangage.titleSeriesPage[6][langageChoice],
      "ascendante": SourceLangage.titleSeriesPage[7][langageChoice],
      "descendante": SourceLangage.titleSeriesPage[11][langageChoice],
      "degressive": SourceLangage.titleSeriesPage[8][langageChoice],
    };

    int themeChoice = 0;
    return BlocBuilder<CreateSeriesBloc, CreateSeriesState>(
  builder: (context, state) {
    bool isSelected = ServiceSeries.isSelectedTypeSeries(state, text);
    return GestureDetector(
      onTap: ServiceSeries.updateTypeSeries(state, context, text),
      child: Opacity(
        opacity: isSelected ? 1 : 0.3,
        child: Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 12),
          height: 42,
          decoration: BoxDecoration(
            color: ThemesColor.themes[2][themeChoice],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SizedBox(width: 15,),
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemesColor.themes[4][themeChoice],
                ),
                child: isSelectedCase(isSelected, themeChoice),
              ),
              SizedBox(width: 15,),
              Text(mapTitle[text] != null ? mapTitle[text]! : "Error mapping",
                style: ThemesTextStyles.themes[5][themeChoice],
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }

  Container isSelectedCase(bool isSelected, int themeChoice) {
    Container containerSelected = Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ThemesColor.themes[2][themeChoice],
      ),
    );
    return isSelected ? containerSelected : Container();
  }

}
