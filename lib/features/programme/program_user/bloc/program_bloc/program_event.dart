part of 'program_bloc.dart';

@immutable
sealed class ProgramEvent {}

class ProgramInitial extends ProgramEvent {
  final String nameFolder;
  ProgramInitial({required this.nameFolder});
}
class ProgramAdd extends ProgramEvent {
  final Program program;
  final String nameFolder;
  ProgramAdd({required this.program,required this.nameFolder});
}
class ProgramDelete extends ProgramEvent {
  final Program program;
  final String nameFolder;
  ProgramDelete({required this.program,required this.nameFolder});
}
class ProgramUpdate extends ProgramEvent {}

