import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'secondary_muscle_event.dart';
part 'secondary_muscle_state.dart';

class SecondaryMuscleBloc extends Bloc<SecondaryMuscleEvent, SecondaryMuscleState> {
  SecondaryMuscleBloc() : super(SecondaryMuscleInitial()) {
    on<SecondaryMuscleEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SecondaryMuscleEventPressed>((event, emit) {
      // TODO: implement event handler
      SecondaryMuscleSelected selected = SecondaryMuscleSelected();
      selected.selectedMuscles.add(event.index);
      emit(selected);
    });
  }
}
