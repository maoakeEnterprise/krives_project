import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/features/programme/program_user/bloc/folder_bloc/folder_bloc.dart';
import 'package:krives_project/features/programme/program_user/widget/tile_used_for_program.dart';

class ProgramActionServices{

  static TileUsedForProgram getTheRightTilesInFolder(Folder folder, FolderState state,int index){
    int length = state is FolderLoaded ? state.folder.folders.length : 0;
    if(index < length){
      return TileUsedForProgram(TileType.folder,folder.folders[index]);
    }
    return TileUsedForProgram(TileType.createFolder,"");
  }

  static void getTheRightTilesInProgram(){}
}