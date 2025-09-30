import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/argument/route_argument.dart';
import 'package:krives_project/core/services/button_action_services.dart';
import 'package:krives_project/core/services/function_services.dart';
import 'package:krives_project/features/authentification/services/auth_server_services.dart';
import 'package:krives_project/features/comment/page/comment_page.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/program_before_work_out_bloc/program_before_work_out_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/playtime_series_bloc/playtime_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';

enum MenuButtonProgramType {
  like,
  liked,
  comment,
  share,
  bookmark,
  bookmarkPressed,
  settingsProgram,
  play
}

enum OwnerOrNot {
  owner,
  notOwnerRegister,
  notOwnerNotRegister,
}


class BeforePlaytimeServices {

  static List<MenuButtonProgramType> listMenuOwner = [/// for the user Owner
    MenuButtonProgramType.like,
    MenuButtonProgramType.comment,
    MenuButtonProgramType.share,
    MenuButtonProgramType.settingsProgram,
    MenuButtonProgramType.play
  ];
  static List<MenuButtonProgramType> listMenuNotOwnerRegister = [ /// for the user who not owner but he register this program in his folders
    MenuButtonProgramType.like,
    MenuButtonProgramType.comment,
    MenuButtonProgramType.share,
    MenuButtonProgramType.bookmarkPressed,
    MenuButtonProgramType.play
  ];
  static List<MenuButtonProgramType> listMenuNotOwnerNotRegister = [ /// for the user who not owner and he did not register the program.
    MenuButtonProgramType.like,
    MenuButtonProgramType.comment,
    MenuButtonProgramType.share,
    MenuButtonProgramType.bookmark,
  ];

  static Map<OwnerOrNot,List<MenuButtonProgramType>> listMenu = { /// here is a map to the 3 options of listMenu
    OwnerOrNot.owner : listMenuOwner,
    OwnerOrNot.notOwnerRegister : listMenuNotOwnerRegister,
    OwnerOrNot.notOwnerNotRegister : listMenuNotOwnerNotRegister,
  };

  ///its a function to get the right menu depends if the user is the owner or if he is not the owner but he register or not the program
  static List<MenuButtonProgramType>? getTheRightMenu(Program program){
    if(program.idUser == AuthServerServices.currentUser!.uid){
      return listMenu[OwnerOrNot.owner];
    }
    else if(program.registeredIn.containsKey(AuthServerServices.currentUser!.uid)){
      return listMenu[OwnerOrNot.notOwnerRegister];
    }
    return listMenu[OwnerOrNot.notOwnerNotRegister];
  }


  ///map for the iconData for eachButton like/comment/share/bookmark/settingsProgram/play
  static Map<MenuButtonProgramType,IconData> iconMap = {
    MenuButtonProgramType.like :Icons.favorite_border,
    MenuButtonProgramType.liked :Icons.favorite,
    MenuButtonProgramType.comment :Icons.mode_comment,
    MenuButtonProgramType.share :Icons.share,
    MenuButtonProgramType.bookmark :Icons.bookmark_border,
    MenuButtonProgramType.bookmarkPressed :Icons.bookmark,
    MenuButtonProgramType.settingsProgram :Icons.settings,
    MenuButtonProgramType.play :Icons.play_circle
  };

  ///its a map where there is all the onPressed function for eachButton like/comment/share/bookmark/settingsProgram/play
  static Map<MenuButtonProgramType,void Function(BuildContext,int,ProgramBeforeWorkOutState,TextEditingController controllerNameProgram)> onTapMap = {
    MenuButtonProgramType.like : (context,int themeChoice,ProgramBeforeWorkOutState state,TextEditingController controllerNameProgram){
      state is ProgramBeforeWorkOutLoaded ?
      context.read<ProgramBeforeWorkOutBloc>().add(ButtonLikePressed(user: state.currentUser, program: state.program, userOwnerProgram: state.userOwnerProgram)) : null;
    },

    MenuButtonProgramType.comment :(context,int themeChoice,ProgramBeforeWorkOutState state,TextEditingController controllerNameProgram){
      state is ProgramBeforeWorkOutLoaded ?
      showComment(context, themeChoice, 0, state.program) : null;
    },

    MenuButtonProgramType.share :(context,int themeChoice,ProgramBeforeWorkOutState state,TextEditingController controllerNameProgram){

    },

    MenuButtonProgramType.bookmark :(context,int themeChoice,ProgramBeforeWorkOutState state,TextEditingController controllerNameProgram){
      ///context.read<RegisterProgramBloc>().add(RegisterProgramPressed());
    },

    MenuButtonProgramType.settingsProgram :(context,int themeChoice,ProgramBeforeWorkOutState state,TextEditingController controllerNameProgram){
      final arguments = FunctionServices.getArgument(context);
      ButtonActionServices.navigateToPage(context, 'program', RouteArgument(idWordTitle: 7,isCheckProgramButton: true,controllerNameProgram: controllerNameProgram,nameActualInFolder: arguments.nameActualInFolder));
    },

    MenuButtonProgramType.play :(context,int themeChoice,ProgramBeforeWorkOutState state,TextEditingController controllerNameProgram){
      ButtonActionServices.navigateToPage(context, 'workout_playtime',
          RouteArgument(titlePage: state is ProgramBeforeWorkOutLoaded ? state.program.name : 'Unknow error',
            program: state is ProgramBeforeWorkOutLoaded ? state.program : null,));
      context.read<CounterSeriesBloc>().add(CounterSerieReset());
      state is ProgramBeforeWorkOutLoaded ? context.read<PlaytimeSeriesBloc>().add(InitWorkout(program: state.program)) : null;
      context.read<TimerBloc>().add(TimerFinishedSeriesPressed());
    },

  };

  ///Map for the color of the button like/comment/share/bookmark/settingsProgram/play
  static Map<MenuButtonProgramType, Color> mapColor = {
    MenuButtonProgramType.like :Colors.white,
    MenuButtonProgramType.liked :Colors.red,
    MenuButtonProgramType.comment :Colors.white,
    MenuButtonProgramType.share :Colors.white,
    MenuButtonProgramType.bookmark :Colors.white,
    MenuButtonProgramType.settingsProgram :Colors.white,
    MenuButtonProgramType.play :Colors.green,
  };

  static Program getCurrentProgramInTheBeforePlayTimeWorkOut(BuildContext context){
    return FunctionServices.getArgument(context).program!;
  }

  static initDownloadDataToTheProgramBeforeWorkOut(BuildContext context){
    context.read<ProgramBeforeWorkOutBloc>().add(LoadData(program: getCurrentProgramInTheBeforePlayTimeWorkOut(context)));
  }

  static String getTheNameToTheMegaProgramCreator(ProgramBeforeWorkOutState state){
    String nameToTheMegaProgramCreator = '';
    nameToTheMegaProgramCreator = state is ProgramBeforeWorkOutLoaded ?  state.userOwnerProgram.name :  'Unknow error';
    return nameToTheMegaProgramCreator;
  }

  static MenuButtonProgramType getTheRightButtonName(ProgramBeforeWorkOutState state,MenuButtonProgramType buttonName){
    if(state is ProgramBeforeWorkOutLoaded){
      if(buttonName == MenuButtonProgramType.like){
        return state.program.idLiked.contains(state.currentUser.id) ? MenuButtonProgramType.liked : MenuButtonProgramType.like;
      }
      else if(buttonName == MenuButtonProgramType.bookmark){
        return state.program.registeredIn.containsKey(state.currentUser.id) ? MenuButtonProgramType.bookmarkPressed : MenuButtonProgramType.bookmark;
      }
    }
    return buttonName;
  }

}