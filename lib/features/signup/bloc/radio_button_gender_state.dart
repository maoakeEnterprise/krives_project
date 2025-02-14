part of 'radio_button_gender_bloc.dart';

@immutable
sealed class RadioButtonGenderState {}

final class RadioButtonGenderInitial extends RadioButtonGenderState {}

final class RadioButtonGenderSelected extends RadioButtonGenderState {
  final int gender;
  RadioButtonGenderSelected({required this.gender});
}
