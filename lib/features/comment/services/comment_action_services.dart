import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentaries.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/features/comment/bloc/bloc_answer_comment/bloc_answer_comment_bloc.dart';
import 'package:krives_project/features/comment/bloc/bloc_comment/comment_bloc.dart';

class CommentActionServices {

  ///comment for the program therer is two states
  ///==================================================
  static VoidCallback addComment(TextEditingController comment, String idProgram, BuildContext context){
    return (){
      String commentText;
      FocusScope.of(context).unfocus();
      commentText = comment.text;
      context.read<AnswerCommentBloc>().add(AnswerProgram());
      context.read<CommentBloc>().add(NewComment(comment: commentText, idProgram: idProgram));
    };
  }

  static void addCommentOnSubmit(String comment, String idProgram, BuildContext context){
    context.read<CommentBloc>().add(NewComment(comment: comment, idProgram: idProgram));
  }
  ///==================================================


  ///comment for the commentary there is two states
  ///==================================================
  static VoidCallback addCommentUnderCommentary(TextEditingController comment, String idProgram, String idCommentary, BuildContext context){
    return (){
      String commentText;
      FocusScope.of(context).unfocus();
      commentText = comment.text;
      context.read<CommentBloc>().add(NewCommentUnderComment(
          comment: commentText,
          idProgram: idProgram,
          idUnderCommentary: idCommentary));
    };
  }

  static void addCommentUnderCommentaryOnSubmit(String comment, String idProgram, String idCommentary, BuildContext context){
    context.read<CommentBloc>().add(NewCommentUnderComment(comment: comment, idProgram: idProgram, idUnderCommentary: idCommentary));
  }
  ///==================================================

  /// action On Submit
  static VoidCallback isUnderCommentOnSubmit(AnswerCommentState state, BuildContext context, String text, String idProgram, String idCommentary){
    return state is AnswerToTheProgram ?
        (){
      addCommentOnSubmit(text, idProgram, context);
    } :
        (){
          context.read<AnswerCommentBloc>().add(AnswerProgram());
          addCommentUnderCommentaryOnSubmit(text, idProgram, idCommentary, context);
    };
  }

  ///action normal
  static VoidCallback isUnderCommentAction(AnswerCommentState state, BuildContext context, TextEditingController text, String idProgram, String idCommentary){
    return state is AnswerToTheProgram ?
    addComment(text, idProgram, context) :
    addCommentUnderCommentary(text, idProgram, idCommentary, context);
  }


  static bool sendRightActionComment(AnswerCommentState state){
    return state is AnswerToTheComment ? true : false;
  }

  static VoidCallback isLikedAction(BuildContext context, Commentary commentary, Commentaries commentaries, Map<String, String> pseudo){
    return () => context.read<CommentBloc>().add(IsLikedComment(commentary: commentary, commentaries: commentaries, pseudo: pseudo));
  }



  static VoidCallback actionAnswerUnderComment(BuildContext context, FocusNode focusNode, String idCommentary){
    return (){
      context.read<AnswerCommentBloc>().add(AnswerUnderComment(idCommentary: idCommentary));
      FocusScope.of(context).unfocus();
      focusNode.requestFocus();
    };

  }

}