part of 'radio_button_gender_bloc.dart';

@immutable
sealed class RadioButtonGenderEvent {}

class RadioButtonGenderChanged extends RadioButtonGenderEvent {
  final int gender;
  RadioButtonGenderChanged({required this.gender});
}
