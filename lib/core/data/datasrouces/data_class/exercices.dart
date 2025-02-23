import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercice.dart';

class Exercises {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<List<Exercice>> getExercicesByIdUser(String idUser) async {
    try{
      final exercicesCollection = await _fireStore.collection('exercices').where('id_user', isEqualTo: idUser).get();
      List<Map<String, dynamic>> exercises = exercicesCollection.docs.map((doc) => doc.data()).toList();
      List<Exercice> listExercice = fromMap(exercises);
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

  static List<Exercice> fromMap(List<Map<String, dynamic>> map){
    List<Exercice> listExercice = [];
    Exercice exercice;
    for(int i = 0; i < map.length; i++){
      exercice = Exercice.fromMap(map[i]);
      listExercice.add(exercice);
    }
    return  listExercice;
  }
}