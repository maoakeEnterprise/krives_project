part of 'program_user_bloc.dart';

@immutable
sealed class ProgramUserEvent {}

class ButtonProgramUser extends ProgramUserEvent {
  final Program program;
  final String idUser;

  ButtonProgramUser({
    required this.program,
    required this.idUser,
  });
}

class ButtonEditProgramUser extends ProgramUserEvent {
  final Program program;
  final String idUser;

  ButtonEditProgramUser({
    required this.program,
    required this.idUser,
  });
}

class ButtonLikeProgramUser extends ProgramUserEvent {
  final Program program;
  final String idUser;

  ButtonLikeProgramUser({
    required this.program,
    required this.idUser,
  });
}

class ButtonRegisterInFolder extends ProgramUserEvent {
  final Program program;
  final String idUser;
  final String nameFolder;

  ButtonRegisterInFolder({
    required this.program,
    required this.idUser,
    required this.nameFolder,
  });
}

class ButtonRegisterProgramUser extends ProgramUserEvent{
  final Program program;
  final String idUser;

  ButtonRegisterProgramUser({
    required this.program,
    required this.idUser,
  });
}

class ButtonCreateFolder extends ProgramUserEvent {
  final String nameFolder;
  final Folders folders;

  ButtonCreateFolder({
    required this.nameFolder,
    required this.folders,
  });
}