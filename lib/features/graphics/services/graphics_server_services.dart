
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/backtracking__exercise.dart';

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
      orderBy('dateTime', descending: true).
      get();

      listBackTracking = exercicesCollection.docs
          .map((doc) => BackTrackingExercice.fromMap(doc.data()))
          .toList();
    }
    catch(error){
      return listBackTracking;
    }

    return listBackTracking;
  }


}