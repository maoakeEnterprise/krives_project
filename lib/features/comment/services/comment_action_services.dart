import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  static void addCommentOnSubmit(String comment, String idProgram, BuildContext context){
    context.read<CommentBloc>().add(NewComment(comment: comment, idProgram: idProgram));
  }
}