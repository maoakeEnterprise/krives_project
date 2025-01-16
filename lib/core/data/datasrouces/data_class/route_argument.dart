import 'package:flutter/cupertino.dart';

class RouteArgument {
  final int? idWordTitle;
  final String? titlePage;
  final bool isCreateExoButton;
  final bool isCreateSeriesButton;
  final bool isExoButtonEdit;
  final bool isProgramButton;
  final bool isAddingProgramButton;
  final String? nameFileProgram;
  final TextEditingController? controllerNameExercice;
  final TextEditingController? controllerCommentaryExercice;
  RouteArgument({
    this.idWordTitle,
    this.titlePage,
    this.controllerNameExercice,
    this.controllerCommentaryExercice,
    this.isCreateExoButton=false,
    this.isExoButtonEdit=false,
    this.isCreateSeriesButton=false,
    this.isProgramButton=false,
    this.isAddingProgramButton=false,
    this.nameFileProgram,

  });
}