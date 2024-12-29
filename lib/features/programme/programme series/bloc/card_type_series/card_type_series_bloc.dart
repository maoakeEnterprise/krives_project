import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_type_series_event.dart';
part 'card_type_series_state.dart';

class CardTypeSeriesBloc extends Bloc<CardTypeSeriesEvent, CardTypeSeriesState> {
  CardTypeSeriesBloc() : super(CardTypeSeriesSelected(numberSelected: "normal")) {
    on<CardTypeSeriesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CardTypeSeriesPressed>((event, emit) => emit(CardTypeSeriesSelected(numberSelected: event.text)));
  }
}
