part of 'menu_widget_bloc.dart';

@immutable
sealed class MenuWidgetEvent {}

final class MenuWidgetEventUserPressed extends MenuWidgetEvent {}
final class MenuWidgetEventHubPressed extends MenuWidgetEvent {}
