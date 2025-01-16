import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/features/popup_add_prog_folder/page/pop_up_add_pf.dart';

class ListTileProgramUser extends StatelessWidget {
  final String? typeDefault;
  final String? nameFolderAddProgram;
  final Program? program;
  final Folder? folder;
  final bool isAddingProgram;

  ListTileProgramUser({
    super.key,
    this.program,
    this.folder,
    this.typeDefault,
    this.isAddingProgram=false,
    this.nameFolderAddProgram,
  });

  final Map<String,IconData> iconMap = {
    "Error Type": Icons.error,
    "program":Icons.sticky_note_2_sharp,
    "folder":Icons.folder_sharp,
    "create_folder":Icons.create_new_folder_sharp,
    "add_file":Icons.add_box_sharp,
    "create_file":Icons.add_box_outlined
  };

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;

    String type = _getType(program, folder,typeDefault);
    String title = _getTitle(program, folder,typeDefault,langageChoice);

    Map<String,VoidCallback> onTapMap = {
      "program": (){
        navigateToPage(context, 'program', RouteArgument(idWordTitle: 7,isProgramButton: true));
      },
      "folder": (){
        navigateToPage(context, 'file_program', RouteArgument(titlePage: title,nameFileProgram: title));
      },
      "create_folder": (){
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context){
              return PopUpAddPf();
            });
      },
      "add_file": (){
        navigateToPage(context, 'file_program', RouteArgument(titlePage: title,isAddingProgramButton: true,nameFileProgram: nameFolderAddProgram));
      },
      "create_file": (){
        navigateToPage(context, 'program', RouteArgument(idWordTitle: 7,isProgramButton: true));
      },
      "adding_program" : (){
        Navigator.of(context).pop();
      }
    };

    return ListTile(
      onTap: isAddingProgram? onTapMap["adding_program"] : onTapMap[type],
      leading: Icon(iconMap[type],color: Colors.grey,),
      title: Text(title,style: TextStyle(color: Colors.white),),
    );
  }
}

String _getType(Program? prog, Folder? folder,String? typeDefault) {
  if(prog != null) {
    return "program";
  }
  if(folder != null) {
    return "folder";
  }
  if (typeDefault != null && (typeDefault.contains('create_') == true || typeDefault == "add_file")) {
    return typeDefault;
  }
  return "Error Type";
}

String _getTitle(Program? prog, Folder? folder, String? typeDefault,int langageChoice) {
  if(prog != null) {
    return prog.name;
  }
  if(folder != null) {
    return folder.name;
  }
  if(typeDefault != null && typeDefault == "create_folder") {
    return SourceLangage.titleProgramsUserLangageWithPopUp[2][langageChoice];
  }
  if(typeDefault != null && typeDefault == "add_file") {
    return SourceLangage.titleProgramsUserLangageWithPopUp[3][langageChoice];
  }
  if(typeDefault != null && typeDefault == "create_file") {
    return SourceLangage.titleProgramsUserLangageWithPopUp[4][langageChoice];
  }
  return "Error Type";
}
