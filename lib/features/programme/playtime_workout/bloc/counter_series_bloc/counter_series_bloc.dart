import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_series_event.dart';
part 'counter_series_state.dart';

class CounterSeriesBloc extends Bloc<CounterSeriesEvent, CounterSeriesState> {
  CounterSeriesBloc() : super(CounterSeriesState(counter: 1)) {
    on<CounterSeriesEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CounterSerieIncremented>((event, emit){
      emit(CounterSeriesState(counter: state.counter+1));
    });
    on<CounterSerieReset>((event, emit){
      emit(CounterSeriesState(counter: 1));
    });
  }
}
