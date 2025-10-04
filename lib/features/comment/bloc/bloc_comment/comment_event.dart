part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class NewComment extends CommentEvent {
  final String comment;
  final String idProgram;
  NewComment({required this.comment, required this.idProgram});
}

class CommentLoad extends CommentEvent {
  final String idProgram;
  CommentLoad({required this.idProgram});
}
