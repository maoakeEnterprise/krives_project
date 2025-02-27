import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/appbar/bloc/action_button/action_button_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo/switch_edit_exo_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/page/exercice_page.dart';
import 'package:krives_project/features/graphics/page/graphics_page.dart';
import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:krives_project/features/home/pages/home_page.dart';
import 'package:krives_project/features/hub_communautaire/bloc/sort_by/sort_by_bloc.dart';
import 'package:krives_project/features/hub_communautaire/page/hub_communautaire_page.dart';
import 'package:krives_project/features/menu/bloc/side_menu_tile_bloc.dart';
import 'package:krives_project/features/profil/page/profil_settings_page.dart';
import 'package:krives_project/features/programme/program_user/page/programs_user.dart';

class MenuServices {

  /// List of all the pages of the menu and with the title
  static final List<Map<String, dynamic>> mapPages = [
    {"title":"Home","titre":"Accueil","body":HomePage()},/// Simulate the header in the DrawerPageMenu
    {"title":"Home","titre":"Accueil","body":HomePage()},
    {"title":"Your Programs","titre":"Tes Programmes","body":ProgramsUser()},
    {"title":"Profile","titre":"Profil","body":ProfilSettingsPage()},
    {"title":"Exercise","titre":"Exercice","body":ExercicePage()},
    {"title":"Commnunity","titre":"Hub Commnunautaire","body":HubCommunautairePage()},
    {"title":"AI Nutrition","titre":"Nutrition IA","body":HomePage()},
    {"title":"AI Program","titre":"Programme IA","body":HomePage()},
    {"title":"Back Tracking","titre":"Suivi Graphique","body":GraphicsPage()},
  ];

  static final List<Function> listFunctionsMenu = [
    ///Simulate the Header
    (BuildContext context,int index){},
    ///homePage where you can see your favorite programs and the last programs you did and the programs of some user of the community
    (BuildContext context,int index){
      noActionButtonOnTheLeftOfTheApp(context);
      colorTheRightButtonMenuPressed(context, index);
    },
    ///Page who contains all your program created or register
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      noActionButtonOnTheLeftOfTheApp(context);
    },
    ///Page setting or profile whatever its the page where you manage your profile : data / settings
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      noActionButtonOnTheLeftOfTheApp(context);
    },
    ///Page with your exercise created by the user
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      context.read<ActionButtonBloc>().add(ActionButtonExercicePressed());///To send a state to the appBar to print the right button
      context.read<SwitchEditExoBloc>().add(SwitchEditExoEventInitPressed());///Init the bloc with the switch edit state in the appBar
    },
    ///Page who contains the programs of the community the print will be calculate with an algorithm
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      noActionButtonOnTheLeftOfTheApp(context);
      context.read<SortByBloc>().add(SortByEventInitial());/// A bloc to initial the sort by when the user search a certain type of program
    },
    ///Its a page with an Nutrition AI
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      noActionButtonOnTheLeftOfTheApp(context);
    },
    ///Its a page with an AI who create some sport program
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      noActionButtonOnTheLeftOfTheApp(context);
    },
    ///Its a page where you can back tracking your perf
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      noActionButtonOnTheLeftOfTheApp(context);
    },
  ];

  static void resetStateBlocMenuPage(BuildContext context){
    context.read<SwitchEditBloc>().add(SwitchEditEventMenuPressed());
  }

  static void colorTheRightButtonMenuPressed(BuildContext context,int index){
    context.read<SideMenuTileBloc>().add(SideMenuTilePressed(index));
  }

  static void noActionButtonOnTheLeftOfTheApp(BuildContext context){
    context.read<ActionButtonBloc>().add(ActionButtonPressed());
  }


  static void initPageMenuFunction(BuildContext context,int index){
    resetStateBlocMenuPage(context);
    colorTheRightButtonMenuPressed(context, index);
  }
}