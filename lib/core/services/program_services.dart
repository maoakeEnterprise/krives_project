
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';

class ProgramServices{

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  ///Functions for the folders services who do the request to the DB server
  static Future<void> initFoldersPrograms(String idUser) async{
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    Folder folder = Folder.initClass();
    await doc.set({Folder.toMap(folder),});
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
    await doc.update(Folder.toMap(folder));
  }

  static Future<void> deleteFolder(Folder folder,String nameFolder) async {
    folder.folders.remove(nameFolder);
    String idUser = _auth.currentUser!.uid;
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    await doc.set({Folder.toMap(folder),});
  }
  static Future<void> updateNameFolder(Folder folder,String nameFolder,int index) async {
    folder.folders[index] = nameFolder;
    String idUser = _auth.currentUser!.uid;
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    await doc.set({Folder.toMap(folder),});
  }

  static Future<void> deleteAccountFolder(String idUser) async {
    final DocumentReference  doc =  _fireStore.collection('folders').doc(idUser);
    await doc.delete();
  }


  ///Functions for the programs services who do the request to the DB server

  ///We send a query : he get the programs with the idUser or the idUser in the array registeredIn
  static Future<List<Program>> getDataPrograms(String nameFolder) async {
    List<Program> programs = [];
    String idUser = _auth.currentUser!.uid;
    final  connectionServerDbPrograms =  _fireStore.collection('programs');
    final query = connectionServerDbPrograms.where(
      Filter.or(
        Filter.and(
          Filter('idUser', isEqualTo: idUser),
          Filter('inFolder', arrayContains: nameFolder),
        ),
      Filter.and(
        Filter('registeredIn', arrayContains: idUser),
        Filter('inFolderOtherUserWhoRegisteredIn', arrayContains: nameFolder),
      ),
    ),);

    final snapshot = await query.get();
    List<Map<String, dynamic>> listProgramFromData = snapshot.docs.map((doc) => doc.data()).toList();

    for (var element in listProgramFromData) {
      programs.add(Program.fromMap(element));
    }
    return programs;
  }

  static Future<void> addProgram(Program program) async {
    String idUser = _auth.currentUser!.uid;
    program.idUser = idUser;
    final docRef = _fireStore.collection('programs').doc();
    program.id = docRef.id;
    Map<String, dynamic> map = Program.toMap(program);
    await docRef.set(map);

  }

  static Future<void> addProgramInFolder(Program program,String nameFolder) async {

  }

  static Future<void> deleteProgram(String idProgram) async {
    final docRef = _fireStore.collection('programs').doc(idProgram);
    await docRef.delete();
  }
  static Future<void> updateProgram(Program program) async {
    String idProgram = program.id;
    final docRef = _fireStore.collection('programs').doc(idProgram);
    Map<String, dynamic> map = Program.toMap(program);
    await docRef.update(map);
  }
}