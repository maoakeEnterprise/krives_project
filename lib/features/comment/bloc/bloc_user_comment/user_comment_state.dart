part of 'user_comment_bloc.dart';

@immutable
sealed class UserCommentState {}

final class UserCommentInitial extends UserCommentState {}

final class UserCommentLoading extends UserCommentState {}
final class UserCommentError extends UserCommentState {
  final String errorMessage;
  UserCommentError({required this.errorMessage});
}
final class UserCommentLoaded extends UserCommentState {
  final String pseudo;
  UserCommentLoaded({required this.pseudo});
}
