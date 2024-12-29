import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'like_program_event.dart';
part 'like_program_state.dart';

class LikeProgramBloc extends Bloc<LikeProgramEvent, LikeProgramState> {
  LikeProgramBloc() : super(LikeProgramUnlike()) {
    on<LikeProgramEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LikeProgramEventPressed>((event, emit){
      emit(state is LikeProgramUnlike ? LikeProgramLike() : LikeProgramUnlike());
    });
  }
}
