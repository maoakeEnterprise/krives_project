part of 'card_type_series_bloc.dart';

@immutable
sealed class CardTypeSeriesEvent {}

final class CardTypeSeriesPressed extends CardTypeSeriesEvent {
  final String text;
  CardTypeSeriesPressed({required this.text});
}
