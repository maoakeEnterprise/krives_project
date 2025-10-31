
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/backtracking__exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/graphics/bloc/graphics_bloc/graphics_data_bloc.dart';

class GraphicsServices {

  static List<BackTrackingExercice> sortByTime(List<BackTrackingExercice> listBackTracking) {

    listBackTracking.sort((a, b) => a.dateTime.compareTo(b.dateTime));
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

  static double  getTheMaxChargeForTheGraph(List<BackTrackingExercice> list){
    int max = 0;
    for(int i = 0; i < list.length; i++){
      if(list[i].maxKg > max){
        max = list[i].maxKg;
      }
    }
    return max.toDouble() + max.toDouble()/3;
  }

  static double getTheGapBetweenOneDay(){
    double gap;
    DateTime dayTest;
    DateTime dayTest1;

    dayTest = DateTime(2025,4,5,0,0,0,0,0);
    dayTest1 = DateTime(2025,4,6,0,0,0,0,0);
    gap = dayTest1.millisecondsSinceEpoch.toDouble() - dayTest.millisecondsSinceEpoch.toDouble();
    return gap;
  }

  static int  getTheFirstItemBackTrackInMilliseconds(List<BackTrackingExercice> list){
    return list[0].dateTime.millisecondsSinceEpoch;
  }
  static int getTheTwelveHoursInMilliseconds(){
    return 12 * 60 * 60 * 1000;
  }
  static int  getTheLastItemBackTrackInMilliseconds(List<BackTrackingExercice> list){
    return list[list.length-1].dateTime.millisecondsSinceEpoch;
  }

  static int  getTheGapBetweenWeek(){
    int gap;
    DateTime dayTest;
    DateTime dayTest1;

    dayTest = DateTime(2025,4,5,0,0,0,0,0);
    dayTest1 = DateTime(2025,4,12,0,0,0,0,0);
    gap = dayTest1.difference(dayTest).inMilliseconds;
    return gap;
  }

  static int differenceInMilliseconds(DateTime date1, DateTime date2){
    return date1.difference(date2).inMilliseconds;
  }



  static List<FlSpot>  getTheFlSpotExercise(List<BackTrackingExercice> list) {
    List<FlSpot> listFlSpot;
    int twelveHourGap;
    FlSpot flSpot;

    listFlSpot = [];
    twelveHourGap = getTheTwelveHoursInMilliseconds();
    for(int i =0; i < list.length; i++) {

      flSpot = FlSpot(list[i].dateTime.millisecondsSinceEpoch.toDouble(), list[i].maxKg.toDouble());
      if(i > 0)
      {
        if(list[i].dateTime.difference(list[i-1].dateTime).inMilliseconds < twelveHourGap) {
          if( list[i].maxKg > list[i-1].maxKg) {
            listFlSpot.removeLast();
            listFlSpot.add(flSpot);
          }
        }
        else {
          listFlSpot.add(flSpot);
        }
      }
      else {
        listFlSpot.add(flSpot);
      }
      print("Date : ${list[i].dateTime.millisecondsSinceEpoch} // Max : ${list[i].maxKg}");
      print("${listFlSpot[listFlSpot.length-1].x} // place i : ${listFlSpot.length-1} // y : ${listFlSpot[listFlSpot.length-1].y}");
    }
    return listFlSpot;
  }

  static List<BackTrackingExercice> getBackTracking(GraphicsDataState state) => state is GraphicsDataLoaded ? state.listBackTracking : [];
  static bool thereIsDataOnBackTracking(GraphicsDataState state) => state is GraphicsDataLoaded  && state.listBackTracking.length > 1 ? true : false;
  static int  getLengthExercise(GraphicsDataLoaded state) => state.listExercise.length;
  static String getExerciseSelected(GraphicsDataLoaded state) => state.idExerciseSelected;
  static List<Exercise> getExercise(GraphicsDataLoaded state) => state.listExercise;
  static String getErrorMessage(GraphicsDataError state) => state.errorMessages;

}