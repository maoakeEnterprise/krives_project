
import 'package:flutter/cupertino.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/programme/program_user/bloc/folder_bloc/folder_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_bloc/program_bloc.dart';
import 'package:krives_project/features/programme/program_user/widget/tile_used_for_program.dart';

class ProgramFunctionServices {


  ///we need to adjust the length to the list cause if we are in a folder create by the user we need to add 2 tiles
  /// folder create by the user => one tile for add create a program and the second one to add a program who already exist in the folder
  ///folder Utilisateur => one tile cause every program create is automatically in this folder so we just need one tile who is here to create a program
  ///folder Enregistrer => 0 tile cause every program in this folder is a program who is register by the user in the social network so he is not the owner (example when you register a reels on instagram )
  static int getTheRightLengthListProgram(String nameFolder, int initLength){
    //int length = 0;
    if(nameFolder == "Enregistrer"){
      return initLength;
    }
    if(nameFolder == "Utilisateur"){
      return initLength+1;
    }
    else{
      return  initLength+2;
    }
  }

  static Program changeNameProgram(TextEditingController newName,Program program){
    program.name = newName.text;
    return program;
  }

  /// get the right tiles for the folders if its the normal tiles with the folder or if its the tile who create a new folder.
  static TileUsedForProgram getTheRightTilesInFolder(Folder folder, FolderState state,int index){
    int length = state is FolderLoaded ? state.folder.folders.length : 0;
    if(index < length){
      return TileUsedForProgram(TileType.folder,folder.folders[index],folder,Program.initClass(),'');
    }
    return TileUsedForProgram(TileType.createFolder,"",folder,Program.initClass(),'');
  }

  static Exercise getTheRightExerciseViaId(String id,List<Exercise> exercises){
    return exercises.firstWhere((element) => element.id == id);
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

      finalLength = ProgramFunctionServices.getTheRightLengthListProgram(state.nameFolder, state.programs.length);

      diff = finalLength - index;

      /// print the Tile CreateProgram if we are not in the folder register or if we are are in the folder user.
      if( diff == 1 && ( !isInRegisterFolder || isInUserFolder) ){return TileUsedForProgram(TileType.createProgram,"",Folder.initClass(),Program.initClass(),state.nameFolder);}

      ///print the Tile Add a Program in a Folder if we are not in the folder register or if we are are in the folder user.
      else if(diff == 2 && !isInRegisterOrUserFolder){return TileUsedForProgram(TileType.addProgramInFolder,"",Folder.initClass(),Program.initClass(),state.nameFolder);}
      /// print the Tile Program for every program who exist in the folder.
      else{
        return TileUsedForProgram(TileType.program, state.programs[index].name,Folder.initClass(),state.programs[index],state.nameFolder);
      }
    }
    ///just here to return a program so its okay
    return TileUsedForProgram(TileType.createProgram,"",Folder.initClass(),Program.initClass(),'');
  }

}