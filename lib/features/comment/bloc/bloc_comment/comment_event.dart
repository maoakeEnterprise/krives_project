part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class NewComment extends CommentEvent {
  final String comment;
  final String idProgram;
  final List<String> idPrintSubComment;
  NewComment({required this.comment, required this.idProgram, required this.idPrintSubComment});
}

class CommentLoad extends CommentEvent {
  final String idProgram;
  CommentLoad({required this.idProgram});
}

class NewCommentUnderComment extends CommentEvent {
  final String comment;
  final String idProgram;
  final String idUnderCommentary;
  final List<String> idPrintSubComment;
  NewCommentUnderComment({required this.comment, required this.idProgram, required this.idUnderCommentary, required this.idPrintSubComment});
}

class IsLikedComment extends CommentEvent {
  final Commentary commentary;
  final Commentaries commentaries;
  final Map<String, String> pseudo;
  final List<String> idPrintSubComment;
  IsLikedComment({required this.commentary, required this.pseudo, required this.commentaries, required this.idPrintSubComment});
}

class PrintSubComment extends CommentEvent{
  final Commentaries commentaries;
  final Map<String, String> pseudo;
  final List<String> idPrintSubComment;
  PrintSubComment({required this.pseudo, required this.idPrintSubComment, required this.commentaries});
}
