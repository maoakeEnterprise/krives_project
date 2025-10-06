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

class NewCommentUnderComment extends CommentEvent {
  final String comment;
  final String idProgram;
  final String idCommentary;
  NewCommentUnderComment({required this.comment, required this.idProgram, required this.idCommentary});
}

class IsLikedComment extends CommentEvent {
  final Commentary commentary;
  final Commentaries commentaries;
  final Map<String, String> pseudo;
  IsLikedComment({required this.commentary, required this.pseudo, required this.commentaries});
}
