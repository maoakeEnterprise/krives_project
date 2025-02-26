part of 'switch_edit_exo_bloc.dart';

@immutable
sealed class SwitchEditExoState {}

final class SwitchEditExoInitial extends SwitchEditExoState {}
final class SwitchEditExoOn extends SwitchEditExoState {}
final class SwitchEditExoOff extends SwitchEditExoState {}
