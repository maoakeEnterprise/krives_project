part of 'card_custom_exo_bloc.dart';

@immutable
sealed class CardCustomExoEvent {}

class CardCustomExoInit extends CardCustomExoEvent {}

class CardCustomExoPressed extends CardCustomExoEvent {
  final int index;
  CardCustomExoPressed({required this.index});
}
