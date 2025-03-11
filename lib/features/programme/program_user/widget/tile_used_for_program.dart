
import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/services_action/button_action_services.dart';
import 'package:krives_project/core/services_action/program_action_services.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

enum TileType{
  folder,
  program,
  createFolder,
  createProgram,
  addProgramInFolder
}

abstract class TileUsedForProgram{
  Widget build(BuildContext context);
  factory TileUsedForProgram(TileType type,String name){
    switch(type){
      case TileType.folder:
        return TileFolder(name);
      case TileType.program:
        return TileProgram(name);
      case TileType.createFolder:
        return TileCreateFolder();
      case TileType.createProgram:
        return TileCreateProgram();
      case TileType.addProgramInFolder:
        return TileAddProgramInFolder();
      }
  }
}

class TileFolder implements TileUsedForProgram{
  final String name;
  int themeChoice = 0;
  TileFolder(this.name);
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.folder_sharp,color: ThemesColor.themes[3][themeChoice],),
      title: Text(name,
        style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: (){
        ButtonActionServices.navigateToPage(context, 'file_program', RouteArgument(titlePage: name));
      },
    );
  }
}
class TileProgram implements TileUsedForProgram{
  final String name;
  int themeChoice = 0;
  TileProgram(this.name);
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.sticky_note_2_sharp,color: ThemesColor.themes[3][themeChoice],),
      title: Text(name,
        style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: (){},
    );
  }
}

class TileCreateFolder implements TileUsedForProgram{
  int langageChoice = 0;
  int themeChoice = 0;
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.create_new_folder_sharp,color: ThemesColor.themes[3][themeChoice],),
      title: Text(SourceLangage.titleProgramsUserLangageWithPopUp[2][langageChoice],
        style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: ProgramActionServices.popUpAddFolderAction(context),
    );
  }
}

class TileCreateProgram implements TileUsedForProgram{
  int langageChoice = 0;
  int themeChoice = 0;
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.add_box,color: ThemesColor.themes[3][themeChoice],),
      title: Text(
        SourceLangage.titleProgramsUserLangageWithPopUp[4][langageChoice],
        style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: (){},
    );
  }
}

class TileAddProgramInFolder implements TileUsedForProgram{
  int langageChoice = 0;
  int themeChoice = 0;
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.add_box_outlined,color: ThemesColor.themes[3][themeChoice],),
      title: Text(SourceLangage.titleProgramsUserLangageWithPopUp[3][langageChoice],
        style: ThemesTextStyles.themes[3][themeChoice],),
      onTap: (){},
    );
  }
}

