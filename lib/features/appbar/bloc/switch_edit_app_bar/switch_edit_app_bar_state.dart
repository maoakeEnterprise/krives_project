part of 'switch_edit_app_bar_bloc.dart';

@immutable
sealed class SwitchEditAppBarState {}

final class EditOn extends SwitchEditAppBarState {}
final class EditOff extends SwitchEditAppBarState {}
