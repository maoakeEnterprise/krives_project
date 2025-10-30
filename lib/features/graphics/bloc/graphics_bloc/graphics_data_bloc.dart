import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/backtracking__exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/features/exercice/services/exercise_server_services.dart';
import 'package:krives_project/features/graphics/services/graphics_server_services.dart';
import 'package:meta/meta.dart';

part 'graphics_data_event.dart';
part 'graphics_data_state.dart';

class GraphicsDataBloc extends Bloc<GraphicsDataEvent, GraphicsDataState> {
  GraphicsDataBloc() : super(GraphicsDataLoading()) {
    on<GetGraphicsDataEvent>(_getGraphicsDataEvent);
    on<GetOneBackTrackExercise>(_getOneBackTrackExercise);
  }

  Future<void> _getGraphicsDataEvent(GetGraphicsDataEvent event, Emitter<GraphicsDataState> emit) async {
    emit(GraphicsDataLoading());
    try{
      List<Exercise> listExercises;
      List<BackTrackingExercice> listBackTracking = [];

      listExercises = await ExerciseServerServices.getExercises();
      listBackTracking = await GraphicsServerServices.getBacktrackingData(listExercises[0].id);
      emit(GraphicsDataLoaded(idExerciseSelected: listExercises[0].id, listExercise: listExercises, listBackTracking: listBackTracking));
    }catch(error){
      emit(GraphicsDataError(errorMessages: "Not possible to get the graphics data : $error"));
    }
  }

  Future<void> _getOneBackTrackExercise(GetOneBackTrackExercise event, Emitter<GraphicsDataState> emit) async {
    try {
      List<BackTrackingExercice> listBackTracking;

      listBackTracking = await GraphicsServerServices.getBacktrackingData(event.idExerciseSelected);
      emit(GraphicsDataLoaded(idExerciseSelected: event.idExerciseSelected, listExercise: event.listExercise, listBackTracking: listBackTracking));
    }
    catch(error){
      emit(GraphicsDataError(errorMessages: "Not possible to get the graphics data : $error"));
    }
  }
}
