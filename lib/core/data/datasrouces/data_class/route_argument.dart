import 'package:flutter/cupertino.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
class RouteArgument {
  final int? idWordTitle;
  final String? titlePage;
  final bool isCreateExoButton;
  final bool isCreateSeriesButton;
  final bool isExoButtonEdit;
  final bool isProgramButton;
  final bool isAddingProgramButton;
  final bool isEditProgramsButton;
  final String? nameFileProgram;
  final Program? program;
  final TextEditingController? controllerNameExercice;
  final TextEditingController? controllerCommentaryExercice;
  RouteArgument({
    this.program,
    this.idWordTitle,
    this.titlePage,
    this.controllerNameExercice,
    this.controllerCommentaryExercice,
    this.isCreateExoButton=false,
    this.isEditProgramsButton=false,
    this.isExoButtonEdit=false,
    this.isCreateSeriesButton=false,
    this.isProgramButton=false,
    this.isAddingProgramButton=false,
    this.nameFileProgram,

  });
}