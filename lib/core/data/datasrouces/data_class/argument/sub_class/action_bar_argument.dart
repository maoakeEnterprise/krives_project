class ActionBarArgument{
  final bool checkSeries;
  final bool checkExercise;
  final bool checkProgram;
  final bool editExercise;
  final bool editFolderProgram;
  final bool editProgram;
  final bool noAction;

  ActionBarArgument({
    this.checkSeries=false,
    this.checkExercise=false,
    this.checkProgram=false,
    this.editExercise=false,
    this.editFolderProgram=false,
    this.editProgram=false,
    this.noAction=false,
});

  static ActionBarArgument init(){
    return ActionBarArgument();
  }
}