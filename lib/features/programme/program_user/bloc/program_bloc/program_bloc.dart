import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/programme/services/program_server_services.dart';
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
    emit(ProgramsLoading());
    try{
      List<Program> programs = await ProgramServerServices.getDataPrograms(event.nameFolder);
      emit(ProgramsLoaded(programs: programs, nameFolder: event.nameFolder));
    }catch(error){
      emit(ProgramsError(message: "Not possible to get the programs : $error"));
    }
  }

  Future<void> _programAdd(ProgramAdd event, Emitter<ProgramState> emit) async{
    try{
      await ProgramServerServices.addProgram(event.program).whenComplete(() async {
        List<Program> programs = await ProgramServerServices.getDataPrograms(event.nameFolder);
        emit(ProgramsLoaded(programs: programs, nameFolder: event.nameFolder));
      });
    }
    catch(error){
      emit(ProgramsError(message: "Not possible to add the programs : $error"));
    }
  }

  Future<void> _programDelete(ProgramDelete event, Emitter<ProgramState> emit) async{
    try{
      await ProgramServerServices.deleteProgram(event.program,event.nameFolder).whenComplete(() async {
        List<Program> programs = await ProgramServerServices.getDataPrograms(event.nameFolder);
        emit(ProgramsLoaded(programs: programs, nameFolder: event.nameFolder));
      });

    }catch(error){
      emit(ProgramsError(message: "Not possible to delete the programs : $error"));
    }
  }

  Future<void> _programUpdate(ProgramUpdate event, Emitter<ProgramState> emit) async{

  } /// #2.3 quand on créé une série on valide la création du programme


}
