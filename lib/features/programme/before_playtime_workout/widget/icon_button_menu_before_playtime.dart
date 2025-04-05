import 'package:flutter/material.dart';
import 'package:krives_project/features/programme/before_playtime_workout/services/berfore_playtime_services.dart';


class IconButtonMenuBeforePlaytime extends StatelessWidget {



  final MenuButtonProgramType buttonName;
  const IconButtonMenuBeforePlaytime({
    required this.buttonName,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice=0;
    int langageChoice=0;

    return IconButton(
        onPressed: () => BeforePlaytimeServices.onTapMap[buttonName]!(context,themeChoice,langageChoice),
        icon: Icon(
          BeforePlaytimeServices.iconMap[buttonName],
            color: BeforePlaytimeServices.mapColor[buttonName],
          size: buttonName != MenuButtonProgramType.play ? 30 : 50,
        ),
    );

  }
}
