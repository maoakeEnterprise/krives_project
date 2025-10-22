import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/backtracking__exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:meta/meta.dart';

part 'graphics_data_event.dart';
part 'graphics_data_state.dart';

class GraphicsDataBloc extends Bloc<GraphicsDataEvent, GraphicsDataState> {
  GraphicsDataBloc() : super(GraphicsDataInitial()) {
    on<GraphicsDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
