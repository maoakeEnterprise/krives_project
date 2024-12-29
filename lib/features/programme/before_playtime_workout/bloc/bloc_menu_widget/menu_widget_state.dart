part of 'menu_widget_bloc.dart';

@immutable
sealed class MenuWidgetState {}

final class MenuWidgetInitial extends MenuWidgetState {}
final class MenuWidgetUser extends MenuWidgetState {}
final class MenuWidgetHub extends MenuWidgetState {}
