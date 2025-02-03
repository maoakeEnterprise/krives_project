import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folders.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:meta/meta.dart';

part 'program_user_event.dart';
part 'program_user_state.dart';

class ProgramUserBloc extends Bloc<ProgramUserEvent, ProgramUserState> {
  ProgramUserBloc() : super(ProgramUserInitial()) {
    on<ProgramUserEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ButtonProgramUser>((event, emit) {
      Program program = event.program;
      bool isProgramLiked = program.isInTheLikes(event.idUser);
      bool isProgramRegister = program.isInTheRegisters(event.idUser);
      emit(ProgramUserLoaded(program: event.program, idUser: event.idUser,isProgramUser: (event.program.idUserOwner == event.idUser), isProgramLiked: isProgramLiked, isProgramRegistered: isProgramRegister));
    });

    on<ButtonLikeProgramUser>((event, emit) {
      Program program = event.program;
      program.addOrRemoveLike(event.idUser);
      bool isProgramLiked = program.isInTheLikes(event.idUser);
      bool isProgramRegister = program.isInTheRegisters(event.idUser);
      emit(ProgramUserLoaded(program: program, idUser: event.idUser,isProgramUser: (program.idUserOwner == event.idUser), isProgramLiked: isProgramLiked, isProgramRegistered: isProgramRegister));
    });

    on<ButtonRegisterProgramUser>((event, emit) {
      Program program = event.program;
      program.addOrRemoveRegister(event.idUser);
      bool isProgramLiked = program.isInTheLikes(event.idUser);
      bool isProgramRegister = program.isInTheRegisters(event.idUser);
      emit(ProgramUserLoaded(program: program, idUser: event.idUser,isProgramUser: (program.idUserOwner == event.idUser), isProgramLiked: isProgramLiked, isProgramRegistered: isProgramRegister));
    });

    on<ButtonEditProgramUser>((event, emit) {
      Program copyProgram = event.program.copyWith();
      emit(ProgramUserTransfer(program: event.program, copyProgram: copyProgram, idUser: event.idUser));

    });
    on<ButtonCreateFolder>((event, emit) {
      Folder folderCreated = Folder(event.nameFolder,"");
      Folders folders = event.folders;
      if(!folders.containsFolder(event.nameFolder) && event.nameFolder != ""){
        folders.addExercice(folderCreated);
      }
      emit(FolderCreated(folders: folders));
    });

    on<ButtonRegisterInFolder>((event, emit) {

      Program program = event.program;
      if(program.idUserOwner == event.idUser){
        program.addInFolder(event.nameFolder);
        emit(ProgramUserLoaded(program: program, idUser: event.idUser));
      }else{
        if(program.isUserIsInTheFolderOtherUser(event.idUser)){
          if(!program.isInTheFolderOtherUser(event.idUser, event.nameFolder)){
            program.addInFolderOtherUser(event.idUser, event.nameFolder);
            emit(ProgramUserLoaded(program: program, idUser: event.idUser));
          }
        }
        else{
          program.addOrRemoveNameFolderOtherUser(event.idUser);
          program.addInFolderOtherUser(event.idUser, event.nameFolder);
          emit(ProgramUserLoaded(program: program, idUser: event.idUser));
        }
      }
    });


  }
}
