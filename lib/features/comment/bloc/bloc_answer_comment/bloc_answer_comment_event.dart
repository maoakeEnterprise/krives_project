part of 'bloc_answer_comment_bloc.dart';

@immutable
sealed class AnswerCommentEvent {}

final class AnswerUnderComment extends AnswerCommentEvent {}
final class AnswerProgram extends AnswerCommentEvent {}
