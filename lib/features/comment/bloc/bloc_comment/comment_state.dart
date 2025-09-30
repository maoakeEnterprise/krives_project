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
  final List<Commentary> commentaries;
  CommentLoaded({required this.commentaries});
}
