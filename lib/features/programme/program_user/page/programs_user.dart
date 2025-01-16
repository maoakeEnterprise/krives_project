import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/features/programme/program_user/widget/list_tile_program_user.dart';

class ProgramsUser extends StatelessWidget {
  const ProgramsUser({super.key});

  @override
  Widget build(BuildContext context) {

    List<Program> programs = [
    Program("1", [], ["Utilisateur"]),
    Program("2", [], ["Register"]),
    Program("3", [], ["Register"]),
    Program("4", [], ["Pec","Utilisateur"]),
    Program("5", [], ["Pec","Utilisateur"]),
    ];
    List<Folder> folders = [
      Folder("Utilisateur"),
      Folder("Register"),
      Folder("Pec"),
      Folder("Nada"),
    ];

    final arguments = ModalRoute.of(context)!.settings.arguments as RouteArgument?;


    return ListView.builder(
      itemCount: arguments != null ?programs.length+(arguments.isAddingProgramButton ?0 : 2) :folders.length+1,
      itemBuilder: (context,index){
        if(arguments != null) {
          return _getTheRightTileProgramUser(programs, folders, arguments, index);
        }

        if(index == folders.length) {
          return ListTileProgramUser(typeDefault: "create_folder",);
        }

        return ListTileProgramUser(folder: folders[index],);
      },
    );
  }
  Widget _getTheRightTileProgramUser(List<Program> programs, List<Folder> folders, RouteArgument arguments,int index) {
    if (!arguments.isAddingProgramButton) {
      if (index == programs.length) {
        return arguments.nameFileProgram != "Utilisateur"
            ? ListTileProgramUser(typeDefault: "add_file", nameFolderAddProgram: arguments.nameFileProgram)
            : Container();
      }
      if (index == programs.length + 1) {
        return ListTileProgramUser(typeDefault: "create_file",);
      }
      if (programs[index].nameFolder.contains(arguments.nameFileProgram)) {
        return ListTileProgramUser(program: programs[index],);
      }
      return Container();
    }
    if(arguments.isAddingProgramButton && !programs[index].nameFolder.contains(arguments.nameFileProgram)){
      return ListTileProgramUser(program: programs[index],isAddingProgram: true,);
    }
    return Container();
  }
}
