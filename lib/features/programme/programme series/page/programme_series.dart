import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/widget_scroll.dart';
import 'package:krives_project/features/programme/programme%20series/widget/card_custom_exo.dart';
import 'package:krives_project/features/programme/programme%20series/widget/card_during_serie_custom.dart';
import 'package:krives_project/features/programme/programme%20series/widget/card_type_series_custom.dart';
import 'package:krives_project/features/programme/programme%20series/widget/group_card_type_series_custom.dart';
import 'package:krives_project/features/programme/programme%20series/widget/number_series_widget.dart';
import 'package:krives_project/features/programme/programme%20series/widget/text_field_custom_series.dart';
import 'package:krives_project/features/programme/programme%20series/widget/title_widget_series.dart';

class ProgrammeSeries extends StatelessWidget {
  const ProgrammeSeries({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return ListView(
      children: [
        TitleWidgetSeries(title: SourceLangage.titleSeriesPage[0][langageChoice],top: 16,),
        TextFieldCustomSeries(),
        WidgetScroll(
          height: 222,
          cardCustom: CardCustomExo(),
          top: 10,
          bottom: 32,
          left: 8,
          itemCount: 4,
        ),
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
        CardDuringSerieCustom(),
      ],
    );
  }
}
