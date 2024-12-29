part of 'number_series_widget_bloc.dart';

@immutable
sealed class NumberSeriesWidgetEvent {}

final class NumberSeriesWidgetPressed extends NumberSeriesWidgetEvent {
  final int numberSelected;
  NumberSeriesWidgetPressed(this.numberSelected);
}
