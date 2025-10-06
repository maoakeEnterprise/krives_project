import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentaries.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/features/comment/bloc/bloc_comment/comment_bloc.dart';

class CommentActionServices {
  static VoidCallback addComment(TextEditingController comment, String idProgram, BuildContext context){
    return (){
      String commentText;
      FocusScope.of(context).unfocus();
      commentText = comment.text;
      context.read<CommentBloc>().add(NewComment(comment: commentText, idProgram: idProgram));
    };
  }

  static VoidCallback isLikedAction(BuildContext context, Commentary commentary, Commentaries commentaries, Map<String, String> pseudo){
    return () => context.read<CommentBloc>().add(IsLikedComment(commentary: commentary, commentaries: commentaries, pseudo: pseudo));
  }

  static void addCommentOnSubmit(String comment, String idProgram, BuildContext context){
    context.read<CommentBloc>().add(NewComment(comment: comment, idProgram: idProgram));
  }
}