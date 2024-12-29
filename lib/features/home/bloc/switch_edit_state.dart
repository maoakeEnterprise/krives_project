part of 'switch_edit_bloc.dart';

@immutable
sealed class SwitchEditState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class SwitchEditStateOn extends SwitchEditState {}

final class SwitchEditStateOff extends SwitchEditState {}
