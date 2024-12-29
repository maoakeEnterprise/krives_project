part of 'switch_edit_bloc.dart';

@immutable
sealed class SwitchEditEvent {}

class SwitchEditEventPressed extends SwitchEditEvent {}
class SwitchEditEventInitPressed extends SwitchEditEvent {}
class SwitchEditEventMenuPressed extends SwitchEditEvent {}
