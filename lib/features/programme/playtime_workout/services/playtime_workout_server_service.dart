
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/backtracking__exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';

class PlaytimeWorkoutServerService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future<void> addStatSeriesBackTracking(Series series) async {
    BackTrackingExercice bte;
    final docRef = _fireStore.collection('back_tracking').doc();
    bte = BackTrackingExercice.initBackTrackingExercice(docRef.id, _auth.currentUser!.uid, series);
    Map<String, dynamic> map = bte.toMap();
    await docRef.set(map);
  }
}