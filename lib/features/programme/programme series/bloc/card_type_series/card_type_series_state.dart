part of 'card_type_series_bloc.dart';

@immutable
sealed class CardTypeSeriesState {}

final class CardTypeSeriesInitial extends CardTypeSeriesState {
}

final class CardTypeSeriesSelected extends CardTypeSeriesState {
  final String numberSelected;
  CardTypeSeriesSelected({required this.numberSelected});
}
