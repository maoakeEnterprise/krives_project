import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/page/exercice_page.dart';
import 'package:krives_project/features/graphics/page/graphics_page.dart';
import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:krives_project/features/home/pages/home_page.dart';
import 'package:krives_project/features/hub_communautaire/bloc/sort_by/sort_by_bloc.dart';
import 'package:krives_project/features/hub_communautaire/page/hub_communautaire_page.dart';
import 'package:krives_project/features/menu/bloc/side_menu_tile_bloc.dart';
import 'package:krives_project/features/profil/page/profile_settings_page.dart';
import 'package:krives_project/features/programme/program_user/page/programs_user.dart';

class MenuFunctionServices {

  /// List of all the pages of the menu and with the title
  static final List<Map<String, dynamic>> mapPages = [
    {"title":"Home","titre":"Accueil","body":HomePage()},/// Simulate the header in the DrawerPageMenu
    {"title":"Home","titre":"Accueil","body":HomePage()},
    {"title":"Your Programs","titre":"Tes Programmes","body":ProgramsUser()},
    {"title":"Profile","titre":"Profil","body":ProfileSettingsPage()},
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
      colorTheRightButtonMenuPressed(context, index);
    },
    ///Page who contains all your program created or register
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      initButtonAppBarEditProgramsFolders(context);
      },
    ///Page setting or profile whatever its the page where you manage your profile : data / settings
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
    },
    ///Page with your exercise created by the user
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      initButtonAppBarEditExercise(context);
      },
    ///Page who contains the programs of the community the print will be calculate with an algorithm
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
      context.read<SortByBloc>().add(SortByEventInitial());/// A bloc to initial the sort by when the user search a certain type of program
    },
    ///Its a page with an Nutrition AI
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
    },
    ///Its a page with an AI who create some sport program
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
    },
    ///Its a page where you can back tracking your perf
    (BuildContext context,int index){
      initPageMenuFunction(context, index);
    },
  ];

  static void resetStateBlocMenuPage(BuildContext context){
    context.read<SwitchEditBloc>().add(SwitchEditEventMenuPressed());
  }

  static void colorTheRightButtonMenuPressed(BuildContext context,int index){
    context.read<SideMenuTileBloc>().add(SideMenuTilePressed(index));
  }



  static void initPageMenuFunction(BuildContext context,int index){
    resetStateBlocMenuPage(context);
    colorTheRightButtonMenuPressed(context, index);
  }

  static void initButtonAppBarEditExercise(BuildContext context){
    context.read<SwitchEditAppBarBloc>().add(InitEventEdit());///Init the bloc with the switch edit state in the appBar
  }
  static void initButtonAppBarEditProgramsFolders(BuildContext context){
    context.read<SwitchEditAppBarBloc>().add(InitEventEdit());///Init the bloc with the switch edit state in the appBar
  }

}