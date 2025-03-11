import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/services/program_services.dart';
import 'package:meta/meta.dart';

part 'folder_event.dart';
part 'folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  FolderBloc() : super(FolderLoading()) {

    on<FolderInitial>(_folderInitial);
    on<FolderAdd>(_folderAdd);

  }

  Future<void> _folderInitial(FolderInitial event, Emitter<FolderState> emit) async{
    try{
      Folder folder = await ProgramServices.getDataFolders();
      emit(FolderLoaded(folder: folder));
    }catch(error){
      emit(FolderError(message: "Not possible to get the folders : $error"));
    }
  }

  Future<void> _folderAdd(FolderAdd event, Emitter<FolderState> emit) async {
    emit(FolderLoading());
    try{
      await ProgramServices.addFolder(event.folder, event.name);
      emit(FolderLoaded(folder: await ProgramServices.getDataFolders()));
    }catch(error){
      emit(FolderError(message: "Not possible to add the folder : $error"));
    }
  }
}
