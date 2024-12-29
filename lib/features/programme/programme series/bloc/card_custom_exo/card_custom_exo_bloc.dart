import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_custom_exo_event.dart';
part 'card_custom_exo_state.dart';

class CardCustomExoBloc extends Bloc<CardCustomExoEvent, CardCustomExoState> {
  CardCustomExoBloc() : super(CardCustomExoInitial()) {
    on<CardCustomExoEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CardCustomExoInit>((event, emit) => emit(CardCustomExoInitial()));
    on<CardCustomExoPressed>((event, emit) => emit(CardCustomExoSelected(event.index)));
  }
}
