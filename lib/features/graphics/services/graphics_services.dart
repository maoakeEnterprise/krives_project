
import 'package:krives_project/core/data/datasrouces/data_class/backtracking__exercise.dart';

class GraphicsServices {

  static List<BackTrackingExercice> sortByTime(List<BackTrackingExercice> listBackTracking) {

    listBackTracking.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return listBackTracking;
  }

}