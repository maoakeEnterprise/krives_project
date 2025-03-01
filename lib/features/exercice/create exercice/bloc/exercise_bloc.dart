import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:meta/meta.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(PrintExerciseInitial(exercise: Exercise.initExercise(), isNewExercise: true,isTransfering: true)) {

    on<NewExercise>(_newExercise);
    on<ExerciseItemSelected>(_exerciseItemSelected);
    on<ModifyItemPressed>(_modifyItemPressed);
  }

  void _newExercise(NewExercise event, Emitter<ExerciseState> emit){
    emit(PrintExerciseLoad(exercise: Exercise.initExercise(), isNewExercise: true,isTransfering: true));
  }
  void _exerciseItemSelected(ExerciseItemSelected event, Emitter<ExerciseState> emit){
    emit(PrintExerciseLoad(exercise: event.exercise, isNewExercise: false,isTransfering: true));
  }
  void _modifyItemPressed(ModifyItemPressed event, Emitter<ExerciseState> emit){
    emit(PrintExerciseLoad(exercise: event.exercise, isNewExercise: event.isNewExercise,isTransfering: false));
  }
}
