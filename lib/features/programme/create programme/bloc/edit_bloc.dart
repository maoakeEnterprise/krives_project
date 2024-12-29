import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditIconNormal()) {
    on<EditEvent>((event, emit) {
      // TODO: implement event handler
      emit(state is EditIconNormal ? EditIconReturn() : EditIconNormal());
    });
  }
}
