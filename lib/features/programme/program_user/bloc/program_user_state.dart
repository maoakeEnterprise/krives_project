part of 'program_user_bloc.dart';

@immutable
sealed class ProgramUserState {}

final class ProgramUserInitial extends ProgramUserState {}

final class ProgramUserLoaded extends ProgramUserState {
  final Program program;
  final String idUser;
  final bool isProgramUser;
  final bool isProgramLiked;
  final bool isProgramRegistered;

  ProgramUserLoaded({
    required this.program,
    required this.idUser,
    this.isProgramUser = false,
    this.isProgramLiked = false,
    this.isProgramRegistered = false,
  });
}

final class ProgramUserTransfer extends ProgramUserState {
  final Program program;
  final Program copyProgram;
  final String idUser;

  ProgramUserTransfer({
    required this.program,
    required this.copyProgram,
    required this.idUser,
  });
}

final class FolderCreated extends ProgramUserState {
  final Folders folders;
  FolderCreated({
    required this.folders,
  });
}