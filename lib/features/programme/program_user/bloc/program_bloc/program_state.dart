part of 'program_bloc.dart';

@immutable
sealed class ProgramState {}

final class ProgramsLoaded extends ProgramState {
  final List<Program> programs;
  final String nameFolder;
  ProgramsLoaded({required this.programs, required this.nameFolder});
}
final class ProgramsLoading extends ProgramState {}
final class ProgramsError extends ProgramState {
  final String message;
  ProgramsError({required this.message});
}
