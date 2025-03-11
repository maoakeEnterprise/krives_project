import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/popup_add_prog_folder/page/pop_up_add_folder.dart';
import 'package:krives_project/features/programme/program_user/bloc/folder_bloc/folder_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_bloc/program_bloc.dart';
import 'package:krives_project/features/programme/program_user/widget/tile_used_for_program.dart';

class ProgramActionServices{


  /// get the right tiles for the folders if its the normal tiles with the folder or if its the tile who create a new folder.
  static TileUsedForProgram getTheRightTilesInFolder(Folder folder, FolderState state,int index){
    int length = state is FolderLoaded ? state.folder.folders.length : 0;
    if(index < length){
      return TileUsedForProgram(TileType.folder,folder.folders[index]);
    }
    return TileUsedForProgram(TileType.createFolder,"");
  }

  static TileUsedForProgram getTheRightTilesInProgram(ProgramState state,List<Program> programs, int index){
    int finalLength;
    if(state is ProgramsLoaded){
      finalLength = state.nameFolder != "Enregistrer" ? state.programs.length+1 : state.programs.length+2;

    }
    return TileUsedForProgram(TileType.createFolder,"");
  }

  ///launch the pop up to add a new folder for the user
  static VoidCallback popUpAddFolderAction(BuildContext context){
    return () =>
        showDialog(context: context,
          barrierDismissible: true,
          builder: (BuildContext context){
            return PopUpAddFolder();
          });
  }

  ///launch the function who is in the FolderBloc FolderAdd with parameters the name of the folder and the list of the folders user.
  static VoidCallback addFolderAction(TextEditingController nameController, BuildContext context, FolderState state){
    return (){
      if(state is FolderLoaded){
        Folder folder = state.folder;
        context.read<FolderBloc>().add(FolderAdd(name: nameController.text, folder: folder));
      }
      Navigator.of(context).pop();
    };
  }

  ///its a function who get the right action for the button if its the confirm button or not
  static VoidCallback getRightAction(bool isConfirmButton, BuildContext context,TextEditingController nameController, FolderState state){
    if(isConfirmButton){
      return addFolderAction(nameController, context,state);
    }
    else {
      return () => Navigator.of(context).pop();
    }
  }
}