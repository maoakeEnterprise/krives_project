import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_edit_app_bar_event.dart';
part 'switch_edit_app_bar_state.dart';

class SwitchEditAppBarBloc extends Bloc<SwitchEditAppBarEvent, SwitchEditAppBarState> {
  SwitchEditAppBarBloc() : super(EditOff()) {
    on<ButtonEditPressed>((event, emit) {
      // TODO: implement event handler
      if(state is EditOff) {
        emit(EditOn());
      }
      else{
        emit(EditOff());
      }
    });
    on<InitEventEdit>((event,emit){
      emit(EditOff());
    });
  }
}
