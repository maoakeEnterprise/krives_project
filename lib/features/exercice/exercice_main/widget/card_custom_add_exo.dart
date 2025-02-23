import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercices.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/repositories/card_custom_add.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercice/exercice_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo_bloc.dart';

class CardCustomAddExo extends StatelessWidget {
  const CardCustomAddExo({super.key});

  @override
  Widget build(BuildContext context) {
    return CardCustomAdd(
      height: 110,
      left: 20,
      onTap: (){
        TextEditingController nameController = TextEditingController();
        TextEditingController videoController = TextEditingController();
        context.read<SwitchEditExoBloc>().add(SwitchEditExoEventInitPressed());
        //context.read<ExerciceBloc>().add(ExerciceNewItem(exercises));
        navigateToPage(context, 'exercise', RouteArgument(titlePage: "Nom Exercice",isCreateExoButton: true,controllerNameExercice: nameController,controllerCommentaryExercice: videoController ));
      },
    );
  }
}
