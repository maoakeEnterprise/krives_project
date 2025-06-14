import 'package:flutter/cupertino.dart';
import 'package:krives_project/core/data/datasrouces/data_class/argument/sub_class/action_bar_argument.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
class RouteArgument {


  final int? idWordTitle;
  final String? titlePage;
  final bool isCheckExerciseButton;// 1
  final bool isCheckSeriesButton;// 1
  final bool isCheckProgramButton;// 1
  final bool isEditExerciseButton; // 1
  final bool isEditProgramsButton; // 1
  final bool isEditFolderProgramButton;
  final Program? program;
  final bool isInProgram;
  final String? nameActualInFolder;
  final TextEditingController? controllerNameExercice;
  final TextEditingController? controllerCommentaryExercice;
  final TextEditingController? controllerNameProgram;
  final ActionBarArgument? actionBarArgument;
  RouteArgument({
    this.program,
    this.idWordTitle,
    this.titlePage,
    this.controllerNameExercice,
    this.controllerCommentaryExercice,
    this.controllerNameProgram,
    this.nameActualInFolder,
    this.isEditProgramsButton=false,
    this.isEditExerciseButton=false,
    this.isEditFolderProgramButton=false,
    this.isCheckSeriesButton=false,
    this.isCheckProgramButton=false,
    this.isCheckExerciseButton=false,
    this.isInProgram=false,
    this.actionBarArgument,
  });
}