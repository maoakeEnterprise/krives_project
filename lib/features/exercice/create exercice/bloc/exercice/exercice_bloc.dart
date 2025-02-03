import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercice.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercices.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/core/data/datasrouces/muscle_data.dart';
import 'package:meta/meta.dart';

part 'exercice_event.dart';
part 'exercice_state.dart';

class ExerciceBloc extends Bloc<ExerciceEvent, ExerciceState> {
  ExerciceBloc() : super(ExerciceInitial()) {
    on<ExerciceEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ExerciceNewItem>((event, emit) {
      emit(ExerciceLoad(exercice: event.exercice, exercises: event.exercises));
    });
    on<ExerciceModifyItemPressed>((event, emit) {
      Exercice exercice = event.exercice;
      exercice.name = event.name != null ? event.name! : event.exercice.name;
      exercice.mainMuscle = event.muscle != null && !event.listMuscle? event.muscle! : event.exercice.mainMuscle;
      exercice.video = event.commentary != null ? event.commentary! : event.exercice.video;
      if(event.listMuscle){
        event.exercice.addOrRemoveMuscle(event.muscle!);
      }
      emit(ExerciceTransfer(exercice: event.exercice, exercises: event.exercises, index: event.index));
    });

    on<ExerciceItemSelected>((event, emit) {
      emit(ExerciceLoad(exercice: event.exercice, exercises: event.exercises, index: event.index));
    });
    on<SuppressExercice>((event, emit) {
      // TODO: implement event handler
      event.exercises.removeExerciseById(event.index);
      emit(ExerciceValidate(exercises: event.exercises));
    });
    on<ConfirmExercice>((event, emit) {
      Exercice exercice = event.exercice;
      exercice.name = event.nameExercice;
      exercice.video = event.commentaryExercice;
      if (event.index != null) {
        event.exercises.modifyExercice(exercice, event.index!);
      } else {
        event.exercises.addExercise(exercice);
      }
      emit(ExerciceValidate(exercises: event.exercises));
    });
  }
}