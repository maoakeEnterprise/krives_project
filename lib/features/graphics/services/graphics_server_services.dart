
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/backtracking__exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/features/graphics/services/graphics_services.dart';

class GraphicsServerServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future<List<BackTrackingExercice>> getBacktrackingData(String idExercise) async {
    String idUser = _auth.currentUser!.uid;
    List<BackTrackingExercice> listBackTracking = [];

    try {
      final exercicesCollection = await _fireStore.collection('back_tracking').
      where('idUser', isEqualTo: idUser).
      where('idExercise', isEqualTo: idExercise).
      get();

      listBackTracking = exercicesCollection.docs
          .map((doc) => BackTrackingExercice.fromMap(doc.data()))
          .toList();
      listBackTracking = GraphicsServices.sortByTime(listBackTracking);
    }
    catch(error){
      return listBackTracking;
    }

    return listBackTracking;
  }

  static Future<List<Exercise>> getExercisesFromBackTracking(List<Exercise> exercises) async {
    List<BackTrackingExercice> listBackTracking = [];

    for(int i = 0; i < exercises.length; i) {
      try {
        listBackTracking = await getBacktrackingData(exercises[i].id);
        if(listBackTracking.length < 2) {
          exercises.removeAt(i);
        }
        else {
          i++;
        }
      }
      catch(error) {
        return exercises;
      }
    }
    return exercises;
  }


}