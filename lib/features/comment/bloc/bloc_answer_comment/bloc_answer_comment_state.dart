part of 'bloc_answer_comment_bloc.dart';

@immutable
sealed class AnswerCommentState {}

final class AnswerCommentInitial extends AnswerCommentState {}

final class AnswerToTheProgram extends AnswerCommentState {}
final class AnswerToTheComment extends AnswerCommentState {
  final String idCommentary;
  AnswerToTheComment({required this.idCommentary});
}
