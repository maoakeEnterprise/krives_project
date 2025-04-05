import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/services/button_action_services.dart';
import 'package:krives_project/features/comment/page/comment_page.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';

enum MenuButtonProgramType {
  like,
  comment,
  share,
  bookmark,
  settingsProgram,
  play
}

enum OwnerOrNot {
  owner,
  notOwnerRegister,
  notOwnerNotRegister,
}


class BeforePlaytimeServices {

  static List<MenuButtonProgramType> listMenuOwner = [
    MenuButtonProgramType.like,
    MenuButtonProgramType.comment,
    MenuButtonProgramType.share,
    MenuButtonProgramType.settingsProgram,
    MenuButtonProgramType.play
  ];
  static List<MenuButtonProgramType> listMenuNotOwnerRegister = [
    MenuButtonProgramType.like,
    MenuButtonProgramType.comment,
    MenuButtonProgramType.share,
    MenuButtonProgramType.bookmark,
    MenuButtonProgramType.play
  ];
  static List<MenuButtonProgramType> listMenuNotOwnerNotRegister = [
    MenuButtonProgramType.like,
    MenuButtonProgramType.comment,
    MenuButtonProgramType.share,
    MenuButtonProgramType.bookmark,
  ];

  static Map<OwnerOrNot,List<MenuButtonProgramType>> listMenu = {
    OwnerOrNot.owner : listMenuOwner,
    OwnerOrNot.notOwnerRegister : listMenuNotOwnerRegister,
    OwnerOrNot.notOwnerNotRegister : listMenuNotOwnerNotRegister,
  };



  static Map<MenuButtonProgramType,IconData> iconMap = {
    MenuButtonProgramType.like :Icons.favorite_border,
    MenuButtonProgramType.comment :Icons.mode_comment,
    MenuButtonProgramType.share :Icons.share,
    MenuButtonProgramType.bookmark :Icons.bookmark_border,
    MenuButtonProgramType.settingsProgram :Icons.settings,
    MenuButtonProgramType.play :Icons.play_circle
  };

  static Map<MenuButtonProgramType,void Function(BuildContext,int,int)> onTapMap = {
    MenuButtonProgramType.like : (context,int themeChoice,int langageChoice){

    },


    MenuButtonProgramType.comment :(context,int themeChoice,int langageChoice){
      showComment(context, themeChoice, langageChoice);
    },

    MenuButtonProgramType.share :(context,int themeChoice,int langageChoice){

    },

    MenuButtonProgramType.bookmark :(context,int themeChoice,int langageChoice){
      ///context.read<RegisterProgramBloc>().add(RegisterProgramPressed());
    },

    MenuButtonProgramType.settingsProgram :(context,int themeChoice,int langageChoice){
      ButtonActionServices.navigateToPage(context, 'program', RouteArgument(idWordTitle: 7,isProgramButton: true));
    },

    MenuButtonProgramType.play :(context,int themeChoice,int langageChoice){
      ButtonActionServices.navigateToPage(context, 'workout_playtime', RouteArgument(titlePage: "Nom Programme"));
      context.read<CounterSeriesBloc>().add(CounterSerieReset());
      context.read<TimerBloc>().add(TimerFinishedSeriesPressed());
    },

  };

  static Map<MenuButtonProgramType, Color> mapColor = {
    MenuButtonProgramType.like :Colors.white,
    MenuButtonProgramType.comment :Colors.white,
    MenuButtonProgramType.share :Colors.white,
    MenuButtonProgramType.bookmark :Colors.white,
    MenuButtonProgramType.settingsProgram :Colors.white,
    MenuButtonProgramType.play :Colors.green,
  };





}