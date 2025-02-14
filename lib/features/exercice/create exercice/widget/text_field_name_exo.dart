import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'dart:math';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercice/exercice_bloc.dart';

class TextFieldNameExo extends StatelessWidget {
  final String labelText;
  const TextFieldNameExo({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as RouteArgument;
    int chooseLangage = 0;
    int randomIntForTrolling = Random().nextInt(
        SourceLangage.trollLangage.length);
    TextEditingController textEditingController = arguments.controllerNameExercice!;
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
        child: BlocBuilder<ExerciceBloc, ExerciceState>(
          builder: (context, state) {
            textEditingController.text = state is ExerciceLoad ? state.exercice.name : textEditingController.text;
            return TextField(
              controller: textEditingController,
              style: ThemesTextStyles.textBigWhite,
              cursorColor: ThemesColor.white,
              decoration: InputDecoration(
                //suffixIcon: const Icon(Icons.clear_rounded),
                //suffixIconColor: Colors.white,
                  labelText: labelText,
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