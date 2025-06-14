import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/create_series_bloc/create_series_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/services/service_series.dart';

class NumberSeriesWidget extends StatelessWidget {
  const NumberSeriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return BlocBuilder<CreateSeriesBloc, CreateSeriesState>(
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
              value: ServiceSeries.getNumberOfSeries(state),
              icon: Icon(Icons.arrow_drop_down,
                color: ThemesColor.themes[7][themeChoice],),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: ThemesColor.themes[7][themeChoice]),
              onChanged: (int? newValue) {},
              items: List.generate(19, (index) =>
                  DropdownMenuItem<int>(
                    value: ServiceSeries.getTheRightIndexNumberSeries(index),///we need to increment +1 to the index cause we start to 1 when we do a series
                    onTap: ServiceSeries.updateNumberOfSeries(state, context, ServiceSeries.getTheRightIndexNumberSeries(index)),
                    child: Text('${index+1}'),
                  ),),
            ),
          ),
        );
      },
    );
  }
}
