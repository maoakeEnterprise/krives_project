import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radio_button_gender_event.dart';
part 'radio_button_gender_state.dart';

class RadioButtonGenderBloc extends Bloc<RadioButtonGenderEvent, RadioButtonGenderState> {
  RadioButtonGenderBloc() : super(RadioButtonGenderInitial()) {
    on<RadioButtonGenderEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<RadioButtonGenderChanged>((event, emit) {
      // TODO: implement event handler
      emit(RadioButtonGenderSelected(gender: event.gender));
    });
  }
}
