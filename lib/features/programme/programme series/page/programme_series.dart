import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/programme/programme%20series/widget/card_during_serie_custom.dart';
import 'package:krives_project/features/programme/programme%20series/widget/group_card_type_series_custom.dart';
import 'package:krives_project/features/programme/programme%20series/widget/number_series_widget.dart';
import 'package:krives_project/features/programme/programme%20series/widget/text_field_custom_series.dart';
import 'package:krives_project/features/programme/programme%20series/widget/title_widget_series.dart';
import 'package:krives_project/features/programme/programme%20series/widget/widget_scroll_series.dart';

class ProgrammeSeries extends StatelessWidget {
  const ProgrammeSeries({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    //int themeChoice = 0;

    TextEditingController controllerCharge = TextEditingController();
    TextEditingController controllerRepeat = TextEditingController();
    TextEditingController controllerDiffCharge = TextEditingController();
    TextEditingController controllerDiffRepeat = TextEditingController();

    return ListView(
      children: [
        TitleWidgetSeries(title: SourceLangage.titleSeriesPage[0][langageChoice],top: 16,),
        TextFieldCustomSeries(),
        WidgetScrollSeries(),
        Row(
          children: [
            TitleWidgetSeries(title: SourceLangage.titleSeriesPage[1][langageChoice],),
            const SizedBox(width: 10,),
            NumberSeriesWidget()
          ],
        ),
        SizedBox(height: 32,),
        TitleWidgetSeries(title: SourceLangage.titleSeriesPage[2][langageChoice],),
        SizedBox(height: 16,),
        GroupCardTypeSeriesCustom(),
        SizedBox(height: 8,),
        TitleWidgetSeries(title: SourceLangage.titleSeriesPage[3][langageChoice],),
        SizedBox(height: 12,),
        CardDuringSerieCustom(
          controllerCharge: controllerCharge,
          controllerRepeat: controllerRepeat,
          controllerDiffCharge: controllerDiffCharge,
          controllerDiffRepeat: controllerDiffRepeat,
        ),
        SizedBox(height: 12,),
      ],
    );
  }
}
