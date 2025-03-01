import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/exercise.dart';
import 'package:krives_project/core/data/datasrouces/data_class/krives_user.dart';
import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/mapping_root.dart';
import 'package:krives_project/core/services/auth_services.dart';
import 'package:krives_project/core/services_action/change_widget_services.dart';
import 'package:krives_project/features/authentification/widget/bloc/auth_bloc.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/bloc_exercise_services/exercise_serv_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo/switch_edit_exo_bloc.dart';
import 'package:krives_project/features/popup_dialog/page/pop_up_delete.dart';
import 'package:krives_project/features/profil/pop_up_dialog/pop_up_delete_account/bloc/pop_delete_account_bloc.dart';

class ButtonActionServices{

  static void navigateToPage(BuildContext context, String routeName, RouteArgument routeArgument) {
    if(routeName.isNotEmpty) {
      Navigator.pushNamed(context,  MappingRoot.namePageRoot[routeName]!,arguments: routeArgument);
    }
    else {
      debugPrint('Route not found for: $routeName');
    }
  }

  /// Authentification actionButtons (connexion,signUp,signOut,deleteAccount,forgetPassword)

  static void connexionOrResetPassword(Map<String,String> map, BuildContext context){

    if(map.length == 2){
      context.read<AuthBloc>().add(AuthSignedIn(email: map['email']!, password: map['password']!,));
    }else{
      context.read<AuthBloc>().add(AuthResetEmail(email: map['email']!,context: context));
    }
  }

  static void signUp(Map<String, TextEditingController> controller,int genderSelected, BuildContext context){

    Map<String,String> map = controller.map((key, value) => MapEntry(key, value.text));
    KrivesUser newUser = KrivesUser.createUser(map, genderSelected);
    String checkPassword = map["confirmPassword"]!;

    bool emptyTextFields = true;
    bool boolPassword;

    List<String> listUser = [
      newUser.pseudo,
      newUser.firstName,
      newUser.name,
      newUser.email,
      newUser.password,
    ];

    for(String data in listUser){
      emptyTextFields = AuthServices.verifEmptyTextField(data);
      if(emptyTextFields == false) break;
    }

    boolPassword = newUser.password == checkPassword ? true : false;
    emptyTextFields && boolPassword ? context.read<AuthBloc>().add(AuthSignedUp(krivesUser: newUser,context: context)) : null;
  }

  static void signOut(BuildContext context){
    context.read<AuthBloc>().add(AuthSignedOut());
  }

  static void popUpDeleteAccount(BuildContext context){
    context.read<PopDeleteAccountBloc>().add(PopIsUp());
  }
  static void popClosed(BuildContext context){
    context.read<PopDeleteAccountBloc>().add(PopClosed());
    Navigator.of(context).pop();
  }

  static void deleteAccount(BuildContext context){
    context.read<AuthBloc>().add(AuthDeleted());
    context.read<PopDeleteAccountBloc>().add(PopClosed());
    Navigator.of(context).pop();
  }

  /**
   * Exercise actionButtons
   * addNewExercises will add a new exercise and reInit the Page ExerciseMainPage
   * modifySecondaryMuscle will add or remove a secondary muscle to the exercise
   * modifyMainMuscle will modify the main muscle to the exercise
   * validateExercise will send the exercise or the newExercise to the database
   * settingsExercise will send the exercise in the page createExercise to print the right data for this exercise
   *////

  static void addNewExercise(BuildContext context,TextEditingController name, TextEditingController video){
    context.read<SwitchEditExoBloc>().add(SwitchEditExoEventInitPressed());
    context.read<ExerciseBloc>().add(NewExercise());
    navigateToPage(context, 'exercise',
        RouteArgument(titlePage: "Exercise",isCreateExoButton: true,
            controllerNameExercice: name,
            controllerCommentaryExercice: video));
  }

  static void modifySecondaryMuscle({required ExerciseState state, required Muscle muscle, required BuildContext context}){
    state.exercise.addOrRemoveMuscle(muscle);
    context.read<ExerciseBloc>().add(ModifyItemPressed(exercise: state.exercise, isNewExercise: state.isNewExercise));
  }

  static void modifyMainMuscle({required ExerciseState state, required Muscle muscle, required BuildContext context}){
    state.exercise.mainMuscle = muscle;
    context.read<ExerciseBloc>().add(ModifyItemPressed(exercise: state.exercise, isNewExercise: state.isNewExercise));
  }

  static void validateExercise(ExerciseState state, TextEditingController name, TextEditingController video, BuildContext context){
    state.exercise.name = name.text;
    state.exercise.video = video.text;
    context.read<ExerciseServBloc>().add(state.isNewExercise ? AddExercise(exercise: state.exercise) : ModifyExercise(exercise: state.exercise));
  }

  static void settingsExercise(BuildContext context, Exercise exercise){
    TextEditingController name = TextEditingController();
    TextEditingController video = TextEditingController();
    navigateToPage(
        context,
        'exercise',
        RouteArgument(
            titlePage: exercise.name,
            isCreateExoButton: true,
            controllerNameExercice: name,
            controllerCommentaryExercice: video,
        ));
    context.read<ExerciseBloc>().add(ExerciseItemSelected(exercise: exercise));
  }

  static void deleteExercise(BuildContext context, Exercise exercise){
    context.read<ExerciseServBloc>().add(DeleteExercise(exercise: exercise));
    Navigator.of(context).pop();
  }

  static void isPopUpDeleteExercise(BuildContext context,Exercise exercise){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return PopUpDelete(exercise: exercise,);
        }
    );
  }

  static void isSettingOrDeleteExerciseFunction(BuildContext context,SwitchEditExoState state,Exercise exercise){
    ChangeWidgetServices.isEditOrDeleteModeExercise(state) ?
        settingsExercise(context, exercise) : isPopUpDeleteExercise(context, exercise);
  }

  static void isConfirmDeleteOrCancelButtonExercise(BuildContext context,Exercise exercise,bool isConfirmDelete){
    isConfirmDelete ? deleteExercise(context, exercise) : Navigator.of(context).pop();
  }

  ///HomePageActionButton

  static VoidCallback navigateInTheProgram(BuildContext context){
    return () => navigateToPage(context, 'program', RouteArgument(idWordTitle: 7,isProgramButton: true));
  }

  ///ProgramActionServices

}