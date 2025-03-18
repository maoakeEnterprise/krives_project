part of 'switch_edit_app_bar_bloc.dart';

@immutable
sealed class SwitchEditAppBarEvent {}

final class ButtonEditPressed extends SwitchEditAppBarEvent {}
final class InitEventEdit extends SwitchEditAppBarEvent {}