import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/program_before_work_out_bloc/program_before_work_out_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/services/berfore_playtime_services.dart';

class ProfileBeforePlaytimeWorkoutWidget extends StatelessWidget {
  final Program program;

  const ProfileBeforePlaytimeWorkoutWidget({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Row(
        children: [
          SizedBox(width: 18,),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 7,),
          BlocBuilder<ProgramBeforeWorkOutBloc, ProgramBeforeWorkOutState>(
            builder: (context, state) {
              return Text(
                BeforePlaytimeServices.getTheNameToTheMegaProgramCreator(state),
                style: ThemesTextStyles.themes[5][themeChoice],
              );
            },
          ),
          SizedBox(width: 28,),
          Text("${program.date.year}",
            style: ThemesTextStyles.themes[0][themeChoice],),
        ],
      ),
    );
  }
}
