
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';

class SeriesServerServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static get authInstance => _auth;

  static Future<List<Series>> getSeries(Program program) async {
    final docRef = _fireStore.collection('series');
    final String idProgram = program.id;

    final QuerySnapshot query = await docRef.where('idUser', isEqualTo: _auth.currentUser!.uid).where('idProgram', isEqualTo: idProgram).get();

    List<Series> listSeries= query.docs.map( (data) => Series.fromMap(data.data() as Map<String, dynamic>)).toList();

    return listSeries;
  }

  static void addNewSeries(Series series){}
  static void deleteSeries(Series series){}
  static void updateSeries(Series series){}
}