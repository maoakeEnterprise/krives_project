
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';

class SeriesServerServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static get authInstance => _auth;

  static Future<List<Series>> getSeries(String programId) async {
    final docRef = _fireStore.collection('series');
    final String idProgram = programId;

    final QuerySnapshot query = await docRef.where('idUser', isEqualTo: _auth.currentUser!.uid).where('idProgram', isEqualTo: idProgram).get();
    List<Series> listSeries= query.docs.map( (data) => Series.fromMap(data.data() as Map<String, dynamic>)).toList();
    listSeries.sort((a,b) => a.orderNumber.compareTo(b.orderNumber));
    return listSeries;
  }

  static void deleteSeries(Series series) async {
    final docRef = _fireStore.collection('series').doc(series.id);
    await docRef.delete();
  }

  static Future<void> addOrUpdateSeries(Series series) async {
    final docRef = _fireStore.collection('series').doc();
    if(series.id == "init"){
      series.id = docRef.id;
      Map<String, dynamic> map = Series.toMap(series);
      await docRef.set(map);
    }
    else{
      final docRefUpdate = _fireStore.collection('series').doc(series.id);
      Map<String, dynamic> map = Series.toMap(series);
      await docRefUpdate.update(map);
    }
  }
}