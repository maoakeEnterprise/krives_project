import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_muscle_event.dart';
part 'main_muscle_state.dart';

class MainMuscleBloc extends Bloc<MainMuscleEvent, MainMuscleState> {
  MainMuscleBloc() : super(MainMuscleInitial()) {
    on<MainMuscleEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<MainMuscleSelect>((event, emit) {
      // TODO: implement event handler
      emit(MainMuscleSelected(index: event.index));
    });
    on<MainMuscleInit>((event, emit) {
      // TODO: implement event handler
      emit(MainMuscleInitial());
    });
  }
}
