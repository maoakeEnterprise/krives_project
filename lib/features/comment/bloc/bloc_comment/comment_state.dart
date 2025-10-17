part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}
final class CommentLoading extends CommentState {}

final class CommentError extends CommentState {
  final String errorMessages;
  CommentError({required this.errorMessages});
}

final class CommentLoaded extends CommentState {
  final List<String> idPrintSubComment;
  final Commentaries commentaries;
  final Map<String, String> pseudo;
  CommentLoaded({required this.commentaries, required this.pseudo, required this.idPrintSubComment});
}
