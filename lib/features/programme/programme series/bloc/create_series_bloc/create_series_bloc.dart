import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/series.dart';
import 'package:krives_project/features/authentification/services/auth_server_services.dart';
import 'package:krives_project/features/programme/services/series_server_services.dart';
import 'package:meta/meta.dart';

part 'create_series_event.dart';
part 'create_series_state.dart';

class CreateSeriesBloc extends Bloc<CreateSeriesEvent, CreateSeriesState> {
  CreateSeriesBloc() : super(SeriesLoading()) {
    on<CreateNewSeries>(_createNewSeries);
    on<LoadSeries>(_loadSeries);
    on<UpdateSeries>(_updateSeries);
    on<ValidateSeries>(_validateSeries);
  }

  Future<void> _createNewSeries(CreateNewSeries event, Emitter<CreateSeriesState> emit) async {
    emit(SeriesLoading());
    try{
      String idUser = AuthServerServices.currentUser!.uid;
      Series newSeries = Series.initSeries(event.program.id,idUser,event.orderNumber);
      emit(CreateSeriesLoaded(series: newSeries));
    }catch(error){
      emit(SeriesError(message: "Not possible to create the series : $error"));
    }
  }
  Future<void> _loadSeries(LoadSeries event, Emitter<CreateSeriesState> emit) async {
    emit(SeriesLoading());
    try{
      Series series = event.series;
      emit(CreateSeriesLoaded(series: series));
    }catch(error){
      emit(SeriesError(message: "Not possible to load the series : $error"));
    }
  }
  Future<void> _updateSeries(UpdateSeries event, Emitter<CreateSeriesState> emit) async {
    try{
      Series series = event.series;
      emit(CreateSeriesLoaded(series: series));
    }catch(error){
      emit(SeriesError(message: "Not possible to update the series : $error"));
    }
  }
  Future<void> _validateSeries(ValidateSeries event, Emitter<CreateSeriesState> emit) async {
    try{
      Series series = event.series;
      await SeriesServerServices.addOrUpdateSeries(series);
      emit(CreateSeriesLoaded(series: series));
    }catch(error){
      emit(SeriesError(message: "Not possible to validate the series : $error"));
    }
  }

}
