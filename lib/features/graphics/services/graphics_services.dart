
import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/backtracking__exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/graphics/bloc/graphics_bloc/graphics_data_bloc.dart';

class GraphicsServices {

  static List<BackTrackingExercice> sortByTime(List<BackTrackingExercice> listBackTracking) {

    listBackTracking.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return listBackTracking;
  }

  static Border isTheExerciseIsSelected(String idExercise, String idExerciseSelected, int themeChoice){
    if(idExercise == idExerciseSelected){
      return Border.all(
        color: ThemesColor.themes[4][themeChoice],
        width: 1,
      );
    }
    return Border();
  }

  static int  getTheMaxChargeForTheGraph(List<BackTrackingExercice> list){
    int max = 0;
    for(int i = 0; i < list.length; i++){
      if(list[i].maxKg > max){
        max = list[i].maxKg;
      }
    }
    return max;
  }
  static List<BackTrackingExercice> getBackTracking(GraphicsDataState state) => state is GraphicsDataLoaded ? state.listBackTracking : [];
  static bool thereIsDataOnBackTracking(GraphicsDataState state) => state is GraphicsDataLoaded  && state.listBackTracking.length > 1 ? true : false;
  static int  getLengthExercise(GraphicsDataLoaded state) => state.listExercise.length;
  static String getExerciseSelected(GraphicsDataLoaded state) => state.idExerciseSelected;
  static List<Exercise> getExercise(GraphicsDataLoaded state) => state.listExercise;
  static String getErrorMessage(GraphicsDataError state) => state.errorMessages;

}