part of 'number_series_widget_bloc.dart';

@immutable
sealed class NumberSeriesWidgetState {}

final class NumberSeriesWidgetInitial extends NumberSeriesWidgetState {}

final class NumberSeriesWidgetNumberSelected extends NumberSeriesWidgetState {
  final int numberSelected;
  NumberSeriesWidgetNumberSelected(this.numberSelected);
}
