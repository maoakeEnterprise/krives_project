import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/services_action/change_widget_services.dart';
import 'package:krives_project/core/services_action/function_services.dart';
import 'dart:math';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/print_exercise/exercise_bloc.dart';

class TextFieldCommentary extends StatefulWidget {
  const TextFieldCommentary({super.key});

  @override
  State<TextFieldCommentary> createState() => _TextFieldCommentaryState();
}

class _TextFieldCommentaryState extends State<TextFieldCommentary> {
  int chooseLangage = 0;
  int randomIntForTrolling = Random().nextInt(SourceLangage.trollLangage.length);
  RouteArgument _arguments = RouteArgument();
  TextEditingController _videoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _arguments = FunctionServices.getArgument(context);
    _videoController = _arguments.controllerCommentaryExercice!;

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            _videoController = ChangeWidgetServices.resetControllersExercise(state, _videoController);
            return TextField(
              controller: _videoController,
              maxLines: 6,
              style: ThemesTextStyles.textNormalWhite,
              cursorColor: ThemesColor.white,
              decoration: InputDecoration(
                  hintText: SourceLangage.trollLangage[randomIntForTrolling][chooseLangage],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: ThemesColor.blackColor3,
                  focusColor: ThemesColor.green1,
                  constraints: BoxConstraints(
                      maxHeight: 110
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}