part of 'add_prog_pop_bloc.dart';

@immutable
abstract class AddProgPopState {}

class AddProgPopInitial extends AddProgPopState {}
final class PopProgramsLoaded extends AddProgPopState {
  final List<Program> programs;
  PopProgramsLoaded({required this.programs});
}
final class PopProgramsLoading extends AddProgPopState {}
final class PopProgramsSend extends AddProgPopState {}
final class PopProgramsError extends AddProgPopState {
  final String message;
  PopProgramsError({required this.message});
}

