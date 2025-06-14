
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/argument/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';
import 'package:krives_project/core/services/button_action_services.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/bloc_exercise_services/exercise_serv_bloc.dart';
import 'package:krives_project/features/programme/create%20programme/bloc/edit_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/create_series_bloc/create_series_bloc.dart';
import 'package:krives_project/features/programme/s_global_bloc/series/series_bloc.dart';

class ServiceSeries {


  static void validateSeries(BuildContext context,CreateSeriesState state){
    if(state is CreateSeriesLoaded){
      context.read<CreateSeriesBloc>().add(ValidateSeries(series: state.series));
      context.read<SeriesBloc>().add(ChangeInTheSeries(idProgram: state.series.idProgram));
    }
  }
  ///=============================================================
  ///FUNCTION VOIDCALLBACK FOR EVERY ONTAP FOR THE SERIES SERVICE
  ///=============================================================
  static VoidCallback createNewSeries(Program program,BuildContext context,List<Series> series){
    return(){
      context.read<CreateSeriesBloc>().add(CreateNewSeries(program: program,orderNumber: series.length));
      context.read<ExerciseServBloc>().add(LoadExercises());
      ButtonActionServices.navigateToPage(context, 'series', RouteArgument(titlePage: "Series",isCheckSeriesButton: true));
    };
  }

  static VoidCallback deleteSeries(BuildContext context,Series series, Program program){
    return (){
      context.read<SeriesBloc>().add(DeleteSeries(series: series,program: program));
    };
  }

  static VoidCallback theRightActionIsSettingOrDeletingSeries(EditState state, BuildContext context,VoidCallback setting,Series series, Program program){
    return state is EditIconNormal ? setting : ServiceSeries.deleteSeries(context,series,program);
  }


  static VoidCallback goUpdateSeries(Program program,Series series,BuildContext context){
    return (){
      //context.read<SeriesBloc>().add(LoadTheSeries(series: series,program: program));
      context.read<CreateSeriesBloc>().add(LoadSeries(series: series));
      context.read<ExerciseServBloc>().add(LoadExercises());
      ButtonActionServices.navigateToPage(context, 'series', RouteArgument(titlePage: "Nom Série",isCheckSeriesButton: true));
    };
  }


///here a function who is use on 'onTap' to update the widget who print the exercise and update locally the exercise who is selected
  static VoidCallback updateExerciseSeries(CreateSeriesState state,BuildContext context,Exercise exercise){
    return (){
      if(state is CreateSeriesLoaded){
        state.series.idExercice = exercise.id;
        context.read<CreateSeriesBloc>().add(UpdateSeries(series: state.series));
      }
    };
  }

///here a function who is use on 'onTap' to update the widget who print the number of series and update locally the number of series
  static VoidCallback updateNumberOfSeries(CreateSeriesState state,BuildContext context,int numberOfSeries){
    return (){
      if(state is CreateSeriesLoaded){
        state.series.numberSeries = numberOfSeries;
        context.read<CreateSeriesBloc>().add(UpdateSeries(series: state.series));
      }
    };
  }

  ///here a function who is use on 'onTap' to update the widget who print the type of series and update locally the type of series
  static VoidCallback updateTypeSeries(CreateSeriesState state,BuildContext context,String typeSeries){
    return (){
      if(state is CreateSeriesLoaded){
        state.series.typeSeries = typeSeries;
        context.read<CreateSeriesBloc>().add(UpdateSeries(series: state.series));
      }
    };
  }

  static void updateTextFieldDataSeries(CreateSeriesState state,BuildContext context,String text,String value){
    if(state is CreateSeriesLoaded){
      if(text == "charge"){state.series.maxKG = int.parse(value);}
      if(text == "repeat"){state.series.numberRep = int.parse(value);}
      if(text == "diffCharge"){state.series.diffKG = int.parse(value);}
      if(text == "diffRepeat"){state.series.diffRep = int.parse(value);}
      context.read<CreateSeriesBloc>().add(UpdateSeries(series: state.series));
    }
  }

  ///=============================================================
  ///=============================================================

  ///sent a bool to see if the card Exercise is selected or not to put a ring around the card exercise who is selected.
  static bool isSelectedExercise(CreateSeriesState state,Exercise exercise){
    if(state is CreateSeriesLoaded){
      return state.series.idExercice == exercise.id;
    }
    return false;
  }

  ///sent a bool to see if the card type of series is selected or not to put a ring under the dot who is selected.
  static bool isSelectedTypeSeries(CreateSeriesState state,String typeSeries){
    if(state is CreateSeriesLoaded){
      return state.series.typeSeries == typeSeries;
    }
    return false;
  }

  ///refresh the value of the number when we load the serie we created or selected
  static int getNumberOfSeries(CreateSeriesState state){
    return state is CreateSeriesLoaded ? state.series.numberSeries : 1;
  }
  static String getTextFieldDataSeries(CreateSeriesState state,String text){
    Map<String, String> map = {
      "charge":state is CreateSeriesLoaded ? state.series.maxKG.toString() : "",
      "repeat":state is CreateSeriesLoaded ? state.series.numberRep.toString() : "",
      "diffCharge":state is CreateSeriesLoaded ? state.series.diffKG.toString() : "",
      "diffRepeat":state is CreateSeriesLoaded ? state.series.diffRep.toString() : "",
    };
    return map[text]!;
  }

  ///we need to increment +1 to the index cause we start to 1 when we do a series
  static int getTheRightIndexNumberSeries(int index){
    return index+1;
  }

  static IconData isIconSettingsOrDeleting(EditState state){
    return state is EditIconNormal ? Icons.settings : Icons.delete;
  }

}