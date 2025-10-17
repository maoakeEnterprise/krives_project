import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentaries.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/features/comment/bloc/bloc_answer_comment/bloc_answer_comment_bloc.dart';
import 'package:krives_project/features/comment/bloc/bloc_comment/comment_bloc.dart';

class CommentActionServices {

  ///comment for the program therer is two states
  ///==================================================
  static VoidCallback addComment(TextEditingController comment, String idProgram, BuildContext context, List<String> idPrintSubComment){
    return (){
      String commentText;
      FocusScope.of(context).unfocus();
      commentText = comment.text;
      context.read<AnswerCommentBloc>().add(AnswerProgram());
      context.read<CommentBloc>().add(NewComment(comment: commentText, idProgram: idProgram, idPrintSubComment: idPrintSubComment));
    };
  }

  static void addCommentOnSubmit(String comment, String idProgram, BuildContext context, List<String> idPrintSubComment){
    context.read<CommentBloc>().add(NewComment(comment: comment, idProgram: idProgram, idPrintSubComment: idPrintSubComment));
  }
  ///==================================================


  ///comment for the commentary there is two states
  ///==================================================
  static VoidCallback addCommentUnderCommentary(TextEditingController comment, String idProgram, String idCommentary, BuildContext context, List<String> idPrintSubComment){
    return (){
      String commentText;
      FocusScope.of(context).unfocus();
      commentText = comment.text;
      context.read<CommentBloc>().add(NewCommentUnderComment(
          comment: commentText,
          idProgram: idProgram,
          idUnderCommentary: idCommentary,
          idPrintSubComment: idPrintSubComment
      ));
    };
  }

  static void addCommentUnderCommentaryOnSubmit(String comment, String idProgram, String idCommentary, BuildContext context, List<String> idPrintSubComment){
    context.read<CommentBloc>().add(NewCommentUnderComment(comment: comment, idProgram: idProgram, idUnderCommentary: idCommentary, idPrintSubComment: idPrintSubComment));
  }
  ///==================================================

  /// action On Submit
  static VoidCallback isUnderCommentOnSubmit(AnswerCommentState state, BuildContext context, String text, String idProgram, String idCommentary, List<String> idPrintSubComment){
    return state is AnswerToTheProgram ?
        (){
      addCommentOnSubmit(text, idProgram, context, idPrintSubComment);
    } :
        (){
          context.read<AnswerCommentBloc>().add(AnswerProgram());
          addCommentUnderCommentaryOnSubmit(text, idProgram, idCommentary, context, idPrintSubComment);
    };
  }

  ///action normal
  static VoidCallback isUnderCommentAction(AnswerCommentState state, BuildContext context, TextEditingController text, String idProgram, String idCommentary, List<String> idPrintSubComment){
    return state is AnswerToTheProgram ?
    addComment(text, idProgram, context, idPrintSubComment) :
    addCommentUnderCommentary(text, idProgram, idCommentary, context, idPrintSubComment);
  }


  static bool sendRightActionComment(AnswerCommentState state){
    return state is AnswerToTheComment ? true : false;
  }

  static VoidCallback isLikedAction(BuildContext context, Commentary commentary, Commentaries commentaries, Map<String, String> pseudo, List<String> idPrintSubComment){
    return () => context.read<CommentBloc>().add(IsLikedComment(commentary: commentary, commentaries: commentaries, pseudo: pseudo, idPrintSubComment: idPrintSubComment));
  }

  static VoidCallback actionPrintSubComment(String idComment, CommentState state, BuildContext context){
    return (){
      List<String> idPrintSubComment = [];
      if(state is CommentLoaded){
        idPrintSubComment = state.idPrintSubComment;
        idPrintSubComment.add(idComment);
        context.read<CommentBloc>().add(PrintSubComment(commentaries: state.commentaries, pseudo: state.pseudo, idPrintSubComment: idPrintSubComment));
      }
    };
  }
  static VoidCallback actionAnswerUnderComment(BuildContext context, FocusNode focusNode, String idCommentary){
    return (){
      context.read<AnswerCommentBloc>().add(AnswerUnderComment(idCommentary: idCommentary));
      FocusScope.of(context).unfocus();
      focusNode.requestFocus();
    };

  }

}