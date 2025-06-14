import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/program_before_work_out_bloc/program_before_work_out_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/services/berfore_playtime_services.dart';


class IconButtonMenuBeforePlaytime extends StatelessWidget {


  final MenuButtonProgramType buttonName;

  const IconButtonMenuBeforePlaytime({
    required this.buttonName,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;

    return BlocBuilder<ProgramBeforeWorkOutBloc, ProgramBeforeWorkOutState>(
      builder: (context, state) {
        TextEditingController controllerNameProgram = TextEditingController();
        return IconButton(
          onPressed: () => BeforePlaytimeServices.onTapMap[buttonName]!(context, themeChoice,state,controllerNameProgram),
          icon: Icon(
            BeforePlaytimeServices.iconMap[BeforePlaytimeServices.getTheRightButtonName(state, buttonName)],
            color: BeforePlaytimeServices.mapColor[BeforePlaytimeServices.getTheRightButtonName(state, buttonName)],
            size: buttonName != MenuButtonProgramType.play ? 30 : 50,
          ),
        );
      },
    );
  }
}
