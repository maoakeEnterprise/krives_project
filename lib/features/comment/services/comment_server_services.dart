
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';

class CommentServerServices {

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future<List<Commentary>> getComments(String idProgram) async {
    final commentsCollection = await _fireStore.collection('comments').where('id_program', isEqualTo: idProgram).get();
    List<Map<String, dynamic>> comments = commentsCollection.docs.map((doc) => doc.data()).toList();
    List<Commentary> listComments = [];
    for(int i = 0; i < comments.length; i++){
      Commentary comment = Commentary.fromMap(comments[i]);
      listComments.add(comment);
    }
    return listComments;
  }

  static Future<void> add(String commentary, String idProgram) async {
    final docRef = _fireStore.collection('comments').doc();
    String idUser = _auth.currentUser!.uid;
    Commentary comment;
    comment = Commentary.initCommentary(commentary: commentary, idProgram: idProgram, idUser: idUser);
    comment.id = docRef.id;
    Map<String, dynamic> map = comment.toMap();
    await docRef.set(map);
  }

  static Future<String> getPseudoName(String idUser) async {
    String pseudo = '';
    final docRef = _fireStore.collection('users').doc(idUser);
    final snapshot = await docRef.get();
    if (snapshot.exists) {
      pseudo = snapshot.data()?['pseudo'] ?? '';
    }
    return pseudo;
  }

  static Future<void> addRemoveLike(Commentary commentary) async {
    final docRed = _fireStore.collection('comments').doc(commentary.id);
    String idUser = _auth.currentUser!.uid;
    commentary.idUserLiked.contains(idUser) ? commentary.idUserLiked.remove(idUser) : commentary.idUserLiked.add(idUser);
    Map<String, dynamic> map = commentary.toMap();
    await docRed.update(map);
  }


}
