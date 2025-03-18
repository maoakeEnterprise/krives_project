import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_edit_programs_event.dart';
part 'switch_edit_programs_state.dart';

class SwitchEditProgramsBloc extends Bloc<SwitchEditProgramsEvent, SwitchEditProgramsState> {
  SwitchEditProgramsBloc() : super(ProgramsEditOff()) {
    on<ProgramsButtonEditPressed>(_editPressed);
    on<ProgramsInitEventEdit>(_initEventEdit);
  }

  void _editPressed(ProgramsButtonEditPressed event, Emitter<SwitchEditProgramsState> emit) => emit(state is ProgramsEditOff ? ProgramsEditOn() : ProgramsEditOff());

  void _initEventEdit(ProgramsInitEventEdit event, Emitter<SwitchEditProgramsState> emit) => emit(ProgramsEditOff());
}
