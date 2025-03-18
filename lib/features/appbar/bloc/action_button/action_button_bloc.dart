import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'action_button_event.dart';
part 'action_button_state.dart';

class ActionButtonBloc extends Bloc<ActionButtonEvent, ActionButtonState> {
  ActionButtonBloc() : super(ActionButtonInitial()) {
    on<ActionButtonEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ActionButtonPressed>((event, emit) => emit(ActionButtonInitial()));

    on<ActionButtonExercicePressed>((event, emit) => emit(ActionButtonEdit()));

    on<ActionButtonProgramsPageWithFoldersPressed>((event, emit) => emit(ActionButtonEditProgram()));

    on<ActionButtonProgramPressed>((event, emit) => emit(ActionButtonDelete()));

    on<ActionButtonCreatePressed>((event, emit) => emit(ActionButtonValidate()));

  }
}
