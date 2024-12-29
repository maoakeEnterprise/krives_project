import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerIsNotDisplayed()) {
    on<TimerEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<TimerValidateSeriesPressed>((event, emit) => emit(TimerIsDisplayed()));
    on<TimerFinishedSeriesPressed>((event, emit) => emit(TimerIsNotDisplayed()));
  }
}
