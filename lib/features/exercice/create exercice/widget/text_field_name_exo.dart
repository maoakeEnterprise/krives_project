import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/services/function_services.dart';
import 'dart:math';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';
import 'package:krives_project/features/exercice/services/exercise_function_services.dart';

class TextFieldNameExo extends StatefulWidget {
  final String labelText;
  const TextFieldNameExo({
    super.key,
    required this.labelText,
  });

  @override
  State<TextFieldNameExo> createState() => _TextFieldNameExoState();
}

class _TextFieldNameExoState extends State<TextFieldNameExo> {
  int chooseLangage = 0;
  int randomIntForTrolling = Random().nextInt(SourceLangage.trollLangage.length);
  RouteArgument _arguments = RouteArgument();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _arguments = FunctionServices.getArgument(context);
    _nameController = _arguments.controllerNameExercice!;

    return Container(
      padding: EdgeInsets.fromLTRB(41, 0, 41, 0),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 5,
                color: Colors.black.withValues(alpha: 0.3),

              )
            ]
        ),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            _nameController = ExerciseFunctionServices.resetControllersExercise(state, _nameController);
            return TextField(
              controller: _nameController,
              style: ThemesTextStyles.textBigWhite,
              cursorColor: ThemesColor.white,
              decoration: InputDecoration(
                  labelText: widget.labelText,
                  labelStyle: ThemesTextStyles.textBigWhite,
                  hintText: SourceLangage
                      .trollLangage[randomIntForTrolling][chooseLangage],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: ThemesColor.blackColor3,
                  focusColor: ThemesColor.green1,
                  constraints: BoxConstraints(
                      maxWidth: 500,
                      maxHeight: 43
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}