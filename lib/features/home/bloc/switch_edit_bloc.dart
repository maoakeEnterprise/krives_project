import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'switch_edit_event.dart';
part 'switch_edit_state.dart';

class SwitchEditBloc extends Bloc<SwitchEditEvent, SwitchEditState> {
  SwitchEditBloc() : super(SwitchEditStateOff()) {
    on<SwitchEditEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SwitchEditEventPressed>((event,emit){
      if(state is SwitchEditStateOff){
        emit(SwitchEditStateOn());
      }
      else{
        emit(SwitchEditStateOff());
      }
    });
    on<SwitchEditEventMenuPressed>((event,emit){
      emit(SwitchEditStateOff());
    });
    on<SwitchEditEventInitPressed>((event,emit){
      emit(SwitchEditStateOff());
    });
}
}
