import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/mapping_root.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/repositories/card_custom_add.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/widget/card_custom_exercise.dart';

class ExercicePage extends StatelessWidget {
  const ExercicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      constraints: BoxConstraints(maxWidth: 500),
      margin: EdgeInsets.fromLTRB(0, 31, 25, 0),
      child: ListView(
        children: [
          CardCustomExercise(),
          SizedBox(height: 29,),
          CardCustomAdd(
            height: 110,
            left: 20,
            onTap: (){
              context.read<SwitchEditExoBloc>().add(SwitchEditExoEventInitPressed());
              navigateToPage(context, 'exercise', RouteArgument(titlePage: "Nom Exercice",isCreateButton: true));
            },
          )
        ],
      ),
    );
  }
}
