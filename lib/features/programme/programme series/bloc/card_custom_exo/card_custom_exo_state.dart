part of 'card_custom_exo_bloc.dart';

@immutable
sealed class CardCustomExoState {}

final class CardCustomExoInitial extends CardCustomExoState {}

final class CardCustomExoSelected extends CardCustomExoState {
  final int index;
  CardCustomExoSelected(this.index);
}
