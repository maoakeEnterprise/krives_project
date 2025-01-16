part of 'register_program_bloc.dart';

@immutable
sealed class RegisterProgramState {}

final class RegisterProgramInitial extends RegisterProgramState {}

final class RegisterProgramRegistered extends RegisterProgramState {}
final class RegisterProgramNotRegistered extends RegisterProgramState {}
