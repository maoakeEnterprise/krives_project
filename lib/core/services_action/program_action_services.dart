import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/services/program_services.dart';
import 'package:krives_project/core/services_action/button_action_services.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/popup_add_prog_folder/page/pop_up_add_folder.dart';
import 'package:krives_project/features/programme/program_user/bloc/folder_bloc/folder_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_bloc/program_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';
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

  static TileUsedForProgram getTheRightTilesInProgram(ProgramState state, int index){
    ///set up the var
    int finalLength;///is here to see the length extent cause sometimes we will need to add 2 or 1 more tiles add/create program
    int diff;///calculate the difference between the index(actual tile we need to print) and the finalLength to see which tiles we need to print
    bool isInRegisterOrUserFolder = false;
    bool isInRegisterFolder = false;
    bool isInUserFolder = false;
    if(state is ProgramsLoaded){
      isInRegisterOrUserFolder = ["Enregistrer","Utilisateur"].contains(state.nameFolder);
      isInRegisterFolder = state.nameFolder == "Enregistrer";
      isInUserFolder = state.nameFolder == "Utilisateur";

      finalLength = ProgramServices.getTheRightLengthListProgram(state.nameFolder, state.programs.length);

      diff = finalLength - index;

      /// print the Tile CreateProgram if we are not in the folder register or if we are are in the folder user.
      if( diff == 1 && ( !isInRegisterFolder || isInUserFolder) ){return TileUsedForProgram(TileType.createProgram,"");}

      ///print the Tile Add a Program in a Folder if we are not in the folder register or if we are are in the folder user.
      else if(diff == 2 && !isInRegisterOrUserFolder){return TileUsedForProgram(TileType.addProgramInFolder,"");}
      /// print the Tile Program for every program who exist in the folder.
      else{
        return TileUsedForProgram(TileType.program, state.programs[index].name);
      }

    }

    ///just here to return a program so its okay
    return TileUsedForProgram(TileType.createProgram,"");
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

  static VoidCallback actionToGoInTheFolder(BuildContext context, String nameFolder){
    return (){
      context.read<SwitchEditProgramsBloc>().add(ProgramsInitEventEdit());
      context.read<ProgramBloc>().add(ProgramInitial(nameFolder: nameFolder));
      ButtonActionServices.navigateToPage(context, 'file_program', RouteArgument(titlePage: nameFolder,isEditProgramsButton: true));
    };
  }

  static bool confirmIfThisFolderCanBeDelete(SwitchEditAppBarState state, String nameFolder){
    return state is EditOn && nameFolder != "Utilisateur" && nameFolder != "Enregistrer";
  }

  static VoidCallback actionToGoInProgram(BuildContext context){
    return (){};
  }

  static VoidCallback actionToCreateProgram(BuildContext context){
    return (){};
  }

  static VoidCallback actionToAddProgramInTheActualFolder(BuildContext context){
    return (){};
  }

  static VoidCallback actionToDeleteFolder(BuildContext context){
    return (){};
  }

  static VoidCallback actionToDeleteProgram(BuildContext context){
    return (){};
  }
}