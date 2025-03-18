part of 'switch_edit_programs_bloc.dart';

@immutable
sealed class SwitchEditProgramsEvent {}

final class ProgramsButtonEditPressed extends SwitchEditProgramsEvent {}
final class ProgramsInitEventEdit extends SwitchEditProgramsEvent {}
