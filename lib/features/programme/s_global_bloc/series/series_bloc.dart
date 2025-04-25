
import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';
import 'package:krives_project/features/programme/services/series_server_services.dart';
import 'package:meta/meta.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {

  SeriesBloc() : super(SeriesLoading()) {
    on<SeriesInit>(_seriesInit);

  }


  Future<void> _seriesInit(SeriesInit event, Emitter<SeriesState> emit) async {
    try{
      List<Series> series = await SeriesServerServices.getSeries(event.program);
      emit(SeriesLoaded(series: series,program: event.program));
    }catch(error){
      emit(SeriesError(message: "Something is wrong when we try to get the series : $error"));
    }
  }
}
