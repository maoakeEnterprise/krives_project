import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/services/function_services.dart';
import 'package:krives_project/features/programme/create%20programme/widget/edit_button_program.dart';
import 'package:krives_project/features/programme/create%20programme/widget/list_view_create_program.dart';
import 'package:krives_project/features/programme/create%20programme/widget/text_field_custom_program.dart';
import 'package:krives_project/features/programme/s_global_bloc/series/series_bloc.dart';

class CreateProgrammePage extends StatelessWidget {
  const CreateProgrammePage({super.key});

  @override
  Widget build(BuildContext context) {
    //int themeChoice = 0;
    //int langageChoice = 0;
    final arguments = FunctionServices.getArgument(context);
    return BlocConsumer<SeriesBloc, SeriesState>(
  listener: (context, state) {
    // TODO: implement listener
    state is SeriesError ? FunctionServices.showSnackBar(context, state.message) : null ;
  },
  builder: (context, state) {
    if(state is SeriesLoading){
      return Center(child: CircularProgressIndicator());
    }
    if(state is SeriesLoaded){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25,),
          Row(
            children: [
              SizedBox(width: 30,),
              TextFieldCustomProgram(labelText: "Nom du Programme",name: state.program.name,controller: arguments.controllerNameProgram!,),
              SizedBox(width: 10,),
              EditButtonProgram(),
            ],
          ),
          Expanded(
            child: ListViewCreateProgram(series: state.series, program: state.program,exercises: state.exercises,),
          ),
        ],
      );
    }

    return Container();

  },
);
  }
}
