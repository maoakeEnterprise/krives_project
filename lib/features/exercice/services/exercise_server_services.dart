import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';

class ExerciseServerServices {

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future<List<Exercise>> getExercises() async {
    String idUser = _auth.currentUser!.uid;
    List<Exercise> listExercice = [];
    Exercise exercice;

    final exercicesCollection = await _fireStore.collection('exercices').where('id_user', isEqualTo: idUser).get();
    List<Map<String, dynamic>> exercises = exercicesCollection.docs.map((doc) => doc.data()).toList();


    for(int i = 0; i < exercises.length; i++){
      exercice = Exercise.fromMap(exercises[i]);
      listExercice.add(exercice);
    }

    return listExercice;
  }

  static Future<void> add(Exercise exercice) async {
    final docRef = _fireStore.collection('exercices').doc();
    exercice.idUser = _auth.currentUser!.uid;
    exercice.id = docRef.id;
    Map<String, dynamic> map = exercice.toMap();
    await docRef.set(map);
  }

  static Future<void> modify(Exercise updatedExercise) async {
    final docRef = _fireStore.collection('exercices').doc(updatedExercise.id);
    Map<String, dynamic> map = updatedExercise.toMap();
    await docRef.update(map);
  }

  static Future<void> delete(String id) async {
    final docRef = _fireStore.collection('exercices').doc(id);
    await docRef.delete();
  }
}