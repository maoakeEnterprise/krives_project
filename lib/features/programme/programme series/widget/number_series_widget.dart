import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/number_series_widget/number_series_widget_bloc.dart';

class NumberSeriesWidget extends StatelessWidget {
  const NumberSeriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return BlocBuilder<NumberSeriesWidgetBloc, NumberSeriesWidgetState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ThemesColor.themes[0][themeChoice],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              dropdownColor: ThemesColor.themes[2][themeChoice],
              value: _getNumberSeries(state),
              icon: Icon(Icons.arrow_drop_down,
                color: ThemesColor.themes[7][themeChoice],),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: ThemesColor.themes[7][themeChoice]),
              onChanged: (int? newValue) {
                //print("$newValue");
              },
              items: List.generate(19, (index) =>
                  DropdownMenuItem<int>(
                    value: index+1,
                    child: Text('${index+1}'),
                    onTap: () {
                      context.read<NumberSeriesWidgetBloc>().add(NumberSeriesWidgetPressed(index));
                    },
                  ),),
            ),
          ),
        );
      },
    );
  }
  int _getNumberSeries(NumberSeriesWidgetState state){
    if(state is NumberSeriesWidgetNumberSelected){
      return state.numberSelected+1;
    }
    return 1;
  }
}
