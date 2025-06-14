import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/argument/route_argument.dart';
import 'package:krives_project/core/services/button_action_services.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/authentification/services/auth_server_services.dart';
import 'package:krives_project/features/popup_add_prog_folder/page/pop_up_add_folder.dart';
import 'package:krives_project/features/programme/program_user/bloc/folder_bloc/folder_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_bloc/program_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';
import 'package:krives_project/features/programme/program_user/widget/draggable_add_program_/bloc/add_prog_pop_bloc.dart';
import 'package:krives_project/features/programme/program_user/widget/draggable_add_program_/draggable_add_program_page.dart';
import 'package:krives_project/features/programme/program_user/widget/pop_up_add_prog/window_add_prog.dart';

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

  static VoidCallback popUpCreateNewProgramAction(BuildContext context,String nameFolder){
    return () =>
        showDialog(context: context,
            barrierDismissible: true,
            builder: (BuildContext context){
              return WindowAddNewProgram(idUser: AuthServerServices.currentUser!.uid,nameFolder: nameFolder,);
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

      ButtonActionServices.navigateToPage(context, 'file_program', RouteArgument(titlePage: nameFolder,isEditProgramsButton: true));
    };
  }

  static bool confirmIfThisFolderCanBeDelete(SwitchEditAppBarState state, String nameFolder){
    return state is EditOn && nameFolder != "Utilisateur" && nameFolder != "Enregistrer";
  }

  static VoidCallback actionToGoInProgram(BuildContext context,Program program,String nameFolder){
    return (){
      ButtonActionServices.navigateToPage(context, 'before_workout_playtime', RouteArgument(titlePage: program.name, program: program,nameActualInFolder: nameFolder,isInProgram: true));
    };
  }

  static VoidCallback actionToCreateProgram(BuildContext context,TextEditingController nameProgram,String nameFolder){
    return (){
      Program program = Program.initClassWithName(nameProgram,nameFolder);
      context.read<ProgramBloc>().add(ProgramAdd(program: program,nameFolder: nameFolder));
      Navigator.of(context).pop();
      //ButtonActionServices.navigateToPage(context, 'program', RouteArgument(titlePage: program.name, program: program));
    };
  }

  static VoidCallback actionToCancelProgram(BuildContext context){return ()=> Navigator.of(context).pop();}

  static VoidCallback actionToDeleteProgram(BuildContext context,Program program,String nameFolder){
    return (){
      context.read<ProgramBloc>().add(ProgramDelete(program: program,nameFolder: nameFolder));
    };
  }

  static VoidCallback actionToAddProgramInTheActualFolder(BuildContext context,String nameFolder){
    return (){
      context.read<AddProgPopBloc>().add(PopProgramInitial(nameFolder: nameFolder));
      ShowDraggableProgram.showDraggableProgram(context, 0,nameFolder);
    };
  }

  static VoidCallback actionToDeleteFolder(BuildContext context, String nameFolder,Folder folder){
    return (){
      context.read<FolderBloc>().add(FolderDelete(name: nameFolder,folder: folder));
    };
  }


}