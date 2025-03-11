part of 'program_bloc.dart';

@immutable
sealed class ProgramEvent {}

class ProgramInitial extends ProgramEvent {
  final String nameFolder;
  ProgramInitial({required this.nameFolder});
}
class ProgramAdd extends ProgramEvent {}
class ProgramDelete extends ProgramEvent {}
class ProgramUpdate extends ProgramEvent {}

