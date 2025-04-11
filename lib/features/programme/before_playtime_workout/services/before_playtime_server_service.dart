

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/krives_user.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';

class BeforePlaytimeServerServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static get authInstance => _auth;

  static Future<KrivesUser> getTheUserOwnerProgram(Program program) async {
    final DocumentReference  doc =  _fireStore.collection('users').doc(program.idUser);
    final DocumentSnapshot snapshot = await doc.get();
    return KrivesUser.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  static Future<Program> getProgram(String id) async {
    final DocumentReference  doc =  _fireStore.collection('programs').doc(id);
    final DocumentSnapshot snapshot = await doc.get();
    return Program.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  static Future<void> likeProgram(KrivesUser user, Program program) async {
    final docRef = _fireStore.collection('programs').doc(program.id);
    program.idLiked.contains(user.id) ? program.idLiked.remove(user.id) : program.idLiked.add(user.id);
    Map<String, dynamic> map = Program.toMap(program);
    await docRef.update(map);
  }

  static Future<void> registerProgram(KrivesUser user, Program program) async {
    final docRef = _fireStore.collection('programs').doc(program.id);
    program.registeredIn.keys.contains(user.id) ? program.registeredIn.remove(user.id) : {program.registeredIn[user.id] = []};
    Map<String, dynamic> map = Program.toMap(program);
    await docRef.update(map);
  }


}