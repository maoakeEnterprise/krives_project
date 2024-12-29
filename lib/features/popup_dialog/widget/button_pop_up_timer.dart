import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';

class ButtonPopUpTimer extends StatelessWidget {
  final bool isConfirmButton;
  const ButtonPopUpTimer({
    super.key,
    this.isConfirmButton = false,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return GestureDetector(
      onTap: isConfirmButton ? () => _confirmSeries(context) : () => _closePopUp(context),
      child: Container(
        width: 150,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isConfirmButton ? ThemesColor.themes[4][themeChoice] : ThemesColor.themes[1][themeChoice],
        ),
        child: Center(
          child: Text(
            isConfirmButton ? _getText(23, langageChoice) : _getText(24, langageChoice),
            style: isConfirmButton ? _getTextStyle(9, themeChoice) : _getTextStyle(8, themeChoice),
          ),
        ),
      ),
    );
  }

  void _closePopUp(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _confirmSeries(BuildContext context) {
    context.read<TimerBloc>().add(TimerValidateSeriesPressed());
    Navigator.of(context).pop();
  }

  String _getText(int index, int langageChoice) => SourceLangage.baseLangage[index][langageChoice];
  TextStyle _getTextStyle(int index, int themeChoice) => ThemesTextStyles.themes[index][themeChoice];

}
