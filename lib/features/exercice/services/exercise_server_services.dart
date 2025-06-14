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

    final exercicesCollection = await _fireStore.collection('exercices').where('id_user', isEqualTo: idUser).get(); /// we call the query to get the exercise who match with the IdUser
    List<Map<String, dynamic>> exercises = exercicesCollection.docs.map((doc) => doc.data()).toList(); /// we put the data in a List of Map<String, dynamic>


    for(int i = 0; i < exercises.length; i++){ /// and we convert this data into a List of Exercise (List<Exercise>) cause the function docs.map do not work properly with the class Exercise cause we have List and Map in the class
      exercice = Exercise.fromMap(exercises[i]);
      listExercice.add(exercice);
    }

    return listExercice;
  }

  static Future<Exercise> getOneExercise(String id) async {
    Exercise exercise;

    final exerciseCollection = await _fireStore.collection('exercices').doc(id).get();
    Map<String, dynamic> map = exerciseCollection.data()!;
    exercise = Exercise.fromMap(map);

    return exercise;

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