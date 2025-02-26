import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_edit_exo_event.dart';
part 'switch_edit_exo_state.dart';

class SwitchEditExoBloc extends Bloc<SwitchEditExoEvent, SwitchEditExoState> {
  SwitchEditExoBloc() : super(SwitchEditExoOff()) {
    on<SwitchEditExoEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SwitchEditExoEventPressed>((event, emit) {
      // TODO: implement event handler
      if(state is SwitchEditExoOff) {
        emit(SwitchEditExoOn());
      }
      else{
        emit(SwitchEditExoOff());
      }
    });
    on<SwitchEditExoEventInitPressed>((event,emit){
      emit(SwitchEditExoOff());
    });
  }
}
