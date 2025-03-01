import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/krives_user.dart';
import 'package:krives_project/core/services/program_services.dart';

import '../../firebase_options.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static User? get currentUser => _auth.currentUser;
  static get authInstance => _auth;

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<void> connectionToDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signUpWithEmailAndPassword(KrivesUser newUser) async {
    await newUser.createUserWithEmailAndPassword();
    await ProgramServices.initFoldersPrograms(newUser.id);
  }

  static Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  static Future<void> deleteAccount() async {
    String idUser = currentUser!.uid;
    final DocumentReference  doc =  _fireStore.collection('users').doc(idUser);
    await doc.delete();
    await ProgramServices.deleteAccountFolder(idUser);
    await currentUser!.delete();
    await signOut();
  }

  static bool verifEmptyTextField(String text) {
    return text.trim().isEmpty || text.contains(RegExp(r'\s+')) ? false : true;
  }

  static Future<KrivesUser> getUserData() async {
    String idUser = currentUser!.uid;
    final DocumentReference  doc =  _fireStore.collection('users').doc(idUser);
    final DocumentSnapshot snapshot = await doc.get();
    return KrivesUser.fromMap(snapshot.data() as Map<String, dynamic>);
  }


}