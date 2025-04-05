import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/services/button_action_services.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/menu/services/menu_function_services.dart';
import 'package:krives_project/features/popup_add_prog_folder/page/pop_up_add_folder.dart';
import 'package:krives_project/features/programme/program_user/bloc/folder_bloc/folder_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_bloc/program_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';

class ProgramActionServices{

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
      context.read<SwitchEditAppBarBloc>().add(InitEventEdit());
      MenuFunctionServices.noActionButtonOnTheLeftOfTheApp(context);
      ButtonActionServices.navigateToPage(context, 'file_program', RouteArgument(titlePage: nameFolder,isEditProgramsButton: true));
    };
  }

  static bool confirmIfThisFolderCanBeDelete(SwitchEditAppBarState state, String nameFolder){
    return state is EditOn && nameFolder != "Utilisateur" && nameFolder != "Enregistrer";
  }

  static VoidCallback actionToGoInProgram(BuildContext context,String nameProgram){
    return (){
      ButtonActionServices.navigateToPage(context, 'before_workout_playtime', RouteArgument(titlePage: nameProgram));
    };
  }

  static VoidCallback actionToCreateProgram(BuildContext context){
    return (){
      ButtonActionServices.navigateToPage(context, 'program', RouteArgument());
    };
  }
  static VoidCallback actionToDeleteProgram(BuildContext context){
    return (){};
  }

  static VoidCallback actionToAddProgramInTheActualFolder(BuildContext context){
    return (){};
  }

  static VoidCallback actionToDeleteFolder(BuildContext context, String nameFolder,Folder folder){
    return (){
      context.read<FolderBloc>().add(FolderDelete(name: nameFolder,folder: folder));
    };
  }


}