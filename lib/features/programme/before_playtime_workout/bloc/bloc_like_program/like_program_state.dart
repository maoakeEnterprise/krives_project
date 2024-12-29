part of 'like_program_bloc.dart';

@immutable
sealed class LikeProgramState {}

final class LikeProgramInitial extends LikeProgramState {}
final class LikeProgramLike extends LikeProgramState {}
final class LikeProgramUnlike extends LikeProgramState {}
