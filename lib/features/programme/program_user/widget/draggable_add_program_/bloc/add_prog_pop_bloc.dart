import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/authentification/services/auth_server_services.dart';
import 'package:krives_project/features/programme/services/program_server_services.dart';
import 'package:meta/meta.dart';

part 'add_prog_pop_event.dart';
part 'add_prog_pop_state.dart';

class AddProgPopBloc extends Bloc<AddProgPopEvent, AddProgPopState> {
  AddProgPopBloc() : super(PopProgramsLoading()) {
    on<PopProgramInitial>(_popProgramInitial);
    on<PopProgramAdd>(_popProgramAdd);


  }
  Future<void> _popProgramInitial( PopProgramInitial event, Emitter<AddProgPopState> emit)async {
    try{
      List<Program> programs = await ProgramServerServices.getDataPrograms("Utilisateur");
      List<Program> programsInFolder = [];
      String idUser = AuthServerServices.currentUser!.uid;
      for (var val in programs) {
        if(val.idUser == idUser){
          if(!val.inFolder.contains(event.nameFolder)){
            programsInFolder.add(val);
          }
        }
        else{
          if(!val.registeredIn[idUser]!.contains(event.nameFolder)){
            programsInFolder.add(val);
          }
        }
      }
      emit(PopProgramsLoaded(programs: programsInFolder));
    } catch(error){
      emit(PopProgramsError(message: "Not possible to load the program : $error"));
    }
  }
  Future<void> _popProgramAdd( PopProgramAdd event, Emitter<AddProgPopState> emit)async {
    try{
      await ProgramServerServices.addProgramInFolder(event.program,event.nameFolder);
      emit(PopProgramsSend());
    } catch(error){
      emit(PopProgramsError(message: "Not possible to add in the folder the program : $error"));
    }
  }
}
