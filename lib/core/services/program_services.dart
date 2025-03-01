
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';

class ProgramServices{

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  ///Functions for the folders services
  static Future<void> initFoldersPrograms(String idUser) async{
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    Folder folder = Folder.initClass();
    await doc.set({folder.toMap(),});
  }

  static Future<Folder> getDataFolders() async {
    Folder folder;
    String idUser = _auth.currentUser!.uid;
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    final DocumentSnapshot snapshot = await doc.get();
    folder = Folder.fromMap(snapshot.data() as Map<String, dynamic>);
    return folder;
  }

  static Future<void> addFolder(Folder folder,String nameFolder) async {
    folder.folders.add(nameFolder);
    String idUser = _auth.currentUser!.uid;
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    await doc.set({folder.toMap(),});
  }
  static Future<void> deleteFolder(Folder folder,String nameFolder) async {
    folder.folders.remove(nameFolder);
    String idUser = _auth.currentUser!.uid;
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    await doc.set({folder.toMap(),});
  }
  static Future<void> updateNameFolder(Folder folder,String nameFolder,int index) async {
    folder.folders[index] = nameFolder;
    String idUser = _auth.currentUser!.uid;
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    await doc.set({folder.toMap(),});
  }

  static Future<void> deleteAccountFolder(String idUser) async {
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    await doc.delete();
  }


  ///Functions for the programs services
  static Future<void> getDataPrograms(String nameFolder) async {}
  static Future<void> addProgram() async {}
  static Future<void> deleteProgram() async {}
  static Future<void> updateProgram() async {}
}