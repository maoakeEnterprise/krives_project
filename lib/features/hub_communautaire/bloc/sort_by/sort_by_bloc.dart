import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sort_by_event.dart';
part 'sort_by_state.dart';

class SortByBloc extends Bloc<SortByEvent, SortByState> {
  SortByBloc() : super(SortByInitial()) {
    on<SortByEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SortByEventPressed>((event, emit) {
      // TODO: implement event handler
      emit(SortByStateSuccess(event.index));
    });
    on<SortByEventInitial>((event, emit) {
      // TODO: implement event handler
      emit(SortByInitial());
    });
  }
}
