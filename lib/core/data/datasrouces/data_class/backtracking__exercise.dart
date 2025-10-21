
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';

class BackTrackingExercice {

  final String id;
  final String idUser;
  final String idExercise;
  final int maxKg;
  final int maxLbs;
  final DateTime dateTime;

  BackTrackingExercice({
    required this.id,
    required this.idUser,
    required this.idExercise,
    required this.maxKg,
    required this.maxLbs,
    required this.dateTime,
});

  static initBackTrackingExercice(String id, String idUser, Series series){
    return BackTrackingExercice(
        id: id,
        idUser: idUser,
        idExercise: series.idExercice,
        maxKg: series.maxKG,
        maxLbs: series.maxLBS,
        dateTime: DateTime.now()
    );
  }

  static BackTrackingExercice fromMap(Map<String, dynamic> map) {
    return BackTrackingExercice(
        id: map['id'],
        idUser: map["idUser"],
        idExercise: map["idExercise"],
        maxKg: map["maxKg"],
        maxLbs: map["maxLbs"],
        dateTime: (map["dateTime"] as Timestamp).toDate()
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'idUser': idUser,
      'idExercise': idExercise,
      'maxKg': maxKg,
      'maxLbs': maxLbs,
      'dateTime': dateTime,
    };
  }

}