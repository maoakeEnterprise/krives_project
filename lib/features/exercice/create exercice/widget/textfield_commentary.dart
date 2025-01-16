import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'dart:math';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercice/exercice_bloc.dart';

class TextFieldCommentary extends StatelessWidget {
  const TextFieldCommentary({super.key});

  @override
  Widget build(BuildContext context) {
    int chooseLangage = 0;
    int randomIntForTrolling = Random().nextInt(
        SourceLangage.trollLangage.length);
    final arguments = ModalRoute.of(context)?.settings.arguments as RouteArgument;
    TextEditingController textEditingController = arguments.controllerCommentaryExercice!;

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: BlocBuilder<ExerciceBloc, ExerciceState>(
          builder: (context, state) {
            textEditingController.text = state is ExerciceLoad ? state.exercice.video : textEditingController.text;
            return TextField(
              controller: textEditingController,
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