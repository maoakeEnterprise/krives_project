import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/services/program_services.dart';
import 'package:meta/meta.dart';

part 'program_event.dart';
part 'program_state.dart';

class ProgramBloc extends Bloc<ProgramEvent, ProgramState> {
  ProgramBloc() : super(ProgramsLoading()) {

    on<ProgramInitial>(_programInitial);
    on<ProgramAdd>(_programAdd);
    on<ProgramDelete>(_programDelete);
    on<ProgramUpdate>(_programUpdate);

  }

  Future<void> _programInitial(ProgramInitial event, Emitter<ProgramState> emit) async{
    try{
      List<Program> programs = await ProgramServices.getDataPrograms(event.nameFolder);
      emit(ProgramsLoaded(programs: programs, nameFolder: event.nameFolder));
    }catch(error){
      emit(ProgramsError(message: "Not possible to get the programs : $error"));
    }
  }
  Future<void> _programAdd(ProgramAdd event, Emitter<ProgramState> emit) async{

  }
  Future<void> _programDelete(ProgramDelete event, Emitter<ProgramState> emit) async{

  }
  Future<void> _programUpdate(ProgramUpdate event, Emitter<ProgramState> emit) async{

  }


}
