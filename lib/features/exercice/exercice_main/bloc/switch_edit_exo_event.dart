part of 'switch_edit_exo_bloc.dart';

@immutable
sealed class SwitchEditExoEvent {}

final class SwitchEditExoEventPressed extends SwitchEditExoEvent {}
final class SwitchEditExoEventInitPressed extends SwitchEditExoEvent {}