import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_program_event.dart';
part 'register_program_state.dart';

class RegisterProgramBloc extends Bloc<RegisterProgramEvent, RegisterProgramState> {
  RegisterProgramBloc() : super(RegisterProgramNotRegistered()) {
    on<RegisterProgramEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<RegisterProgramPressed>((event, emit) {
      // TODO: implement event handler
      emit(state is RegisterProgramNotRegistered ? RegisterProgramRegistered() : RegisterProgramNotRegistered());
    });
  }
}
