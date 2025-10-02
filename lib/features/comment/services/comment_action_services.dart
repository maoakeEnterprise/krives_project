import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/comment/bloc/bloc_comment/comment_bloc.dart';

class CommentActionServices {
  static VoidCallback addComment(String comment, String idProgram, BuildContext context){
    return (){
      context.read<CommentBloc>().add(NewComment(comment: comment, idProgram: idProgram));
    };
  }
}