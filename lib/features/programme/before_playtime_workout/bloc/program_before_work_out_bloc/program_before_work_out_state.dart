part of 'program_before_work_out_bloc.dart';

@immutable
abstract class ProgramBeforeWorkOutState {}

class ProgramBeforeWorkOutInitial extends ProgramBeforeWorkOutState {}

final class ProgramBeforeWorkOutLoading extends ProgramBeforeWorkOutState {}
final class ProgramBeforeWorkOutLoaded extends ProgramBeforeWorkOutState {
  final KrivesUser userOwnerProgram;
  final KrivesUser currentUser;
  final Program program;
  ProgramBeforeWorkOutLoaded({
    required this.userOwnerProgram,
    required this.currentUser,
    required this.program,

  });
}

final class ProgramBeforeWorkOutError extends ProgramBeforeWorkOutState {
  final String message;
  ProgramBeforeWorkOutError({required this.message});
}

