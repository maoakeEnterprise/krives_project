
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentaries.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/comment/widget/comment_section_widget.dart';

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

  ///decide which text he will print (the text : See X other answer)
  static String getRightTextForOtherAnswer(Commentary commentary, Commentaries commentaries, int langageChoice){
    String text =
        "${SourceLangage.baseCommentPageLangage[6][langageChoice]} "
        "${commentaries.getLengthSubCommentaries(commentary.id)}"
        " ${SourceLangage.baseCommentPageLangage[commentaries.getLengthSubCommentaries(commentary.id) > 1 ? 8 : 7][langageChoice]}";
    return text;
  }

  static bool thereIsOtherAnswer(Commentary commentary, Commentaries commentaries, List<String> idPrintSubComment){
    return commentaries.getLengthSubCommentaries(commentary.id) > 0 && !idPrintSubComment.contains(commentary.id) ? true : false;
  }

  static Widget didWePrintTheCommentary(CommentSectionWidget widgetToSend, Commentary comment, List<String> idPrintSubComment){
    if ( idPrintSubComment.contains(comment.idAnswerCommentary) || comment.idAnswerCommentary == "1") {
      return widgetToSend;
    }
    return Container();
  }

  static bool canGetTheButtonAnswerOnSubComment(Commentary commentary){
    return commentary.idAnswerCommentary == "1" ? true : false;
  }

  static Widget isASubCommentPrintingForAddSPace(List<String> idPrintSubComment, Commentary comment){

    if(idPrintSubComment.contains(comment.idAnswerCommentary))
    {
      return SizedBox(width: 35,);
    }
    return Container();
  }

}