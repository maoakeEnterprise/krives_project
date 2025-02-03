import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folders.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_user_bloc.dart';
import 'package:krives_project/features/programme/program_user/widget/list_tile_program_user.dart';

class ProgramsUser extends StatefulWidget {
  const ProgramsUser({super.key});

  @override
  State<ProgramsUser> createState() => _ProgramsUserState();
}

class _ProgramsUserState extends State<ProgramsUser> {

  Folders folders = Folders([
    Folder("User",""),
    Folder("Register",""),
    Folder("Pec",""),
    Folder("Nada",""),
  ]);
  List<Program> programs = [
    Program(idUserOwner: "test",name: "1",nameFolder: ["User","Pec"]),
    Program(idUserOwner: "test",name: "2",nameFolder: ["User",]),
    Program(idUserOwner: "test",name: "3",nameFolder: ["User","Pec"]),
    Program(idUserOwner: "test",name: "4",nameFolder: ["User","Pec"]),
    Program(idUserOwner: "test1",name: "5",nameFolder: ["User",], registers: [],nameFolderOtherUser: {}),
    Program(idUserOwner: "test1",name: "6",nameFolder: ["User",], registers: ["test"],nameFolderOtherUser: {"test":["Pec"]}),
  ];

  @override
  Widget build(BuildContext context) {
    //Initiate a list of program like if the program was in a database online same for the folders
    //need to get the arguments cause we need to know if we click on a program or a folder
    final arguments = ModalRoute.of(context)!.settings.arguments as RouteArgument?;
    int itemCounter;

    return BlocBuilder<ProgramUserBloc, ProgramUserState>(
      builder: (context, state) {
        itemCounter = arguments != null ?programs.length+(arguments.isAddingProgramButton || arguments.nameFileProgram == "Register" ? 0 : 2) :folders.folders.length+1;
        return ListView.builder(
          //if arguments is null it tell us we are in the initiate page if arguments is not null it tell use we are in a folder
          // and we need to see if we are in an instance of adding a program or if we are in a register folder to see if we add 0 or 2 in the opposite case
          itemCount: itemCounter,
          itemBuilder: (context,index){

            //We verify if the arguments is not null to see if we are in a folder or not
            if(arguments != null) {
              return _getTheRightTileProgramUser(programs, folders, arguments, index, "test");
            }
            //The case if we are in the initiate page
            if(index == folders.folders.length) {
              return ListTileProgramUser(typeDefault: "create_folder",idUser: "test",folders: folders,);
            }
            return ListTileProgramUser(folder: folders.folders[index],idUser: "test",);
            },
        );
      },
    );
  }

  Widget _getTheRightTileProgramUser(List<Program> programs, Folders folders, RouteArgument arguments, int index, String idUser,) {
    final isAddingProgramButton = arguments.isAddingProgramButton;
    final nameFileProgram = arguments.nameFileProgram;

    if (!isAddingProgramButton) {
      if (index == programs.length) {
        // Bouton "add_file" si ce n'est pas dans le dossier "User"
        return nameFileProgram != "User"
            ? ListTileProgramUser(typeDefault: "add_file", nameFolderAddProgram: nameFileProgram, idUser: idUser)
            : Container();
      }

      if (index == programs.length + 1) {
        // Bouton "create_file"
        return ListTileProgramUser(typeDefault: "create_file", idUser: idUser);
      }

      final program = programs[index];
      if (program.idUserOwner == idUser && program.nameFolder.contains(nameFileProgram)) {
        return ListTileProgramUser(program: program, idUser: idUser);
      }

      if (nameFileProgram == "Register" && program.registers.contains(idUser)) {
        return ListTileProgramUser(program: program, idUser: idUser);
      }

      if (program.nameFolderOtherUser[idUser]?.contains(nameFileProgram) == true) {
        return ListTileProgramUser(program: program, idUser: idUser);
      }

      return Container(); // Cas par défaut
    }

    if (isAddingProgramButton) {
      final program = programs[index];
      if (!program.nameFolder.contains(nameFileProgram) && program.idUserOwner == idUser) {
        return ListTileProgramUser(program: program, isAddingProgram: true, idUser: idUser);
      }

      if (program.registers.contains(idUser) &&
          !(program.nameFolderOtherUser[idUser]?.contains(nameFileProgram) ?? false) &&
          nameFileProgram != "User" &&
          nameFileProgram != "Register") {
        return ListTileProgramUser(program: program, isAddingProgram: true, idUser: idUser);
      }
    }

    return Container();
  }
}
