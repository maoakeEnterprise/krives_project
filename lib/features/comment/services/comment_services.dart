
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/core/theme/themes_color.dart';

class CommentServices {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static bool isLikedComment(Commentary commentary){
    String idUser = _auth.currentUser!.uid;
    return commentary.idUserLiked.contains(idUser) ? true : false;
  }

  static Color isLikedCommentColoration(Commentary commentary, int themeChoice){
    return isLikedComment(commentary) ? ThemesColor.themes[5][themeChoice] : ThemesColor.themes[3][themeChoice];
  }

  static IconData isLikedCommentIcons(Commentary commentary){
    return isLikedComment(commentary) ? Icons.favorite : Icons.favorite_border;
  }
}