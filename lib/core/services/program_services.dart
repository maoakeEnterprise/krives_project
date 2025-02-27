
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProgramServices{

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static void initFoldersPrograms(String idUser) async{
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    await doc.set({});
  }
}