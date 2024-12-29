import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'number_series_widget_event.dart';
part 'number_series_widget_state.dart';

class NumberSeriesWidgetBloc extends Bloc<NumberSeriesWidgetEvent, NumberSeriesWidgetState> {
  NumberSeriesWidgetBloc() : super(NumberSeriesWidgetInitial()) {
    on<NumberSeriesWidgetEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NumberSeriesWidgetPressed>((event, emit) => emit(NumberSeriesWidgetNumberSelected(event.numberSelected)));
  }
}
