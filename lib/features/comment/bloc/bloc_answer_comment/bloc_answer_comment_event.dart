part of 'bloc_answer_comment_bloc.dart';

@immutable
sealed class AnswerCommentEvent {}

final class AnswerUnderComment extends AnswerCommentEvent {
  final String idCommentary;
  AnswerUnderComment({required this.idCommentary});
}

final class AnswerProgram extends AnswerCommentEvent {}
