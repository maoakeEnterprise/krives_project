import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';

class Exercises {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<List<Exercise>> getExercicesByIdUser(String idUser) async {
    try{
      final exercicesCollection = await _fireStore.collection('exercices').where('id_user', isEqualTo: idUser).get();
      List<Map<String, dynamic>> exercises = exercicesCollection.docs.map((doc) => doc.data()).toList();
      List<Exercise> listExercice = fromMap(exercises);
      return listExercice;
    }
    catch(e){
      log('$e');
      rethrow;
    }

  }

  CollectionReference<Map<String, dynamic>> getDocExercices(){
    return _fireStore.collection('exercices');
  }

  static List<Exercise> fromMap(List<Map<String, dynamic>> map){
    List<Exercise> listExercice = [];
    Exercise exercice;
    for(int i = 0; i < map.length; i++){
      exercice = Exercise.fromMap(map[i]);
      listExercice.add(exercice);
    }
    return  listExercice;
  }
}