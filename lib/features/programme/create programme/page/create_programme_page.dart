import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/mapping_root.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/data/repositories/card_custom_add.dart';
import 'package:krives_project/core/data/repositories/textfield_theme1.dart';
import 'package:krives_project/features/programme/create%20programme/widget/edit_button_program.dart';
import 'package:krives_project/features/programme/create%20programme/widget/text_field_custom_program.dart';
import 'package:krives_project/features/programme/create%20programme/widget/widget_card_series.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/card_custom_exo/card_custom_exo_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/card_type_series/card_type_series_bloc.dart';

class CreateProgrammePage extends StatelessWidget {
  const CreateProgrammePage({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25,),
        Row(
          children: [
            SizedBox(width: 30,),
            TextFieldCustomProgram(labelText: "Nom du Programme"),
            SizedBox(width: 10,),
            EditButtonProgram(),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              WidgetCardSeries(
                onTap: (){navigateToPage(context, 'series', RouteArgument(titlePage: "Nom Série",isCreateButton: true));},
              ),
              SizedBox(height: 16,),
              CardCustomAdd(
                onTap: (){
                  context.read<CardCustomExoBloc>().add(CardCustomExoInit());
                  context.read<CardTypeSeriesBloc>().add(CardTypeSeriesPressed(text: "normal"));
                  navigateToPage(context, 'series', RouteArgument(titlePage: "Nom Série",isCreateButton: true));
                  },
                height: 110,
                left: 40,
                right: 40,
                labelText: SourceLangage.titleProgrammLangage[4][langageChoice],),
            ],
          ),
        ),
      ],
    );
  }
}
