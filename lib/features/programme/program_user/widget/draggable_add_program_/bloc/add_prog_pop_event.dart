part of 'add_prog_pop_bloc.dart';

@immutable
abstract class AddProgPopEvent {}

class PopProgramAdd extends AddProgPopEvent {
  final Program program;
  final String nameFolder;
  PopProgramAdd({required this.program,required this.nameFolder});
}

class PopProgramInitial extends AddProgPopEvent {
  final String nameFolder;
  PopProgramInitial({required this.nameFolder});
}
