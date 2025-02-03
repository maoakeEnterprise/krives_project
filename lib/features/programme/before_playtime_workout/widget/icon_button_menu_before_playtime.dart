import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/features/comment/page/comment_page.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/bloc_like_program/like_program_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/register_program/register_program_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_user_bloc.dart';

class IconButtonMenuBeforePlaytime extends StatelessWidget {
  static Map<String,IconData> iconMap = {
    "like":Icons.favorite_border,
    "liked":Icons.favorite,
    "comment":Icons.mode_comment,
    "share":Icons.share,
    "bookmark":Icons.bookmark_border,
    "bookmarked":Icons.bookmark,
    "settingsProgram":Icons.settings,
    "play":Icons.play_circle
  };

  final String buttonName;
  const IconButtonMenuBeforePlaytime({
    required this.buttonName,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice=0;
    int langageChoice=0;

    void onLikeTap(Program program, String idUser){
      context.read<ProgramUserBloc>().add(ButtonLikeProgramUser(program: program, idUser: idUser));
    }
    void onRegisterTap(Program program, String idUser){context.read<ProgramUserBloc>().add(ButtonRegisterProgramUser(program: program, idUser: idUser));}

    Map<String,VoidCallback> onTapMap = {
      "like":(){},
      "liked":(){},
      "comment":(){showComment(context, themeChoice, langageChoice);},
      "share":(){},
      "bookmark":(){context.read<RegisterProgramBloc>().add(RegisterProgramPressed());},
      "bookmarked":(){},
      "settingsProgram":(){
        navigateToPage(context, 'program', RouteArgument(idWordTitle: 7,isProgramButton: true));
        },
      "play":(){
        navigateToPage(context, 'workout_playtime', RouteArgument(titlePage: "Nom Programme"));
        context.read<CounterSeriesBloc>().add(CounterSerieReset());
        context.read<TimerBloc>().add(TimerFinishedSeriesPressed());
      }
    };
    Icon icon;
    VoidCallback? onTap = onTapMap[buttonName];
    if(["like", "liked", "bookmark", "bookmarked"].contains(buttonName)){
      return BlocBuilder<ProgramUserBloc, ProgramUserState>(
        builder: (context, state) {
          if(state is ProgramUserLoaded){
            onTap =["like","liked"].contains(buttonName) ?
                () => onLikeTap(state.program, state.idUser) :
                () => onRegisterTap(state.program, state.idUser);
          }
          icon = _getIcon(state, buttonName);
          return IconButton(onPressed: (onTap), icon: icon);
        },
      );
    }
    icon = buttonName=="play" ? Icon(iconMap[buttonName],color: Colors.green,size: 60,) : Icon(iconMap[buttonName],color: Colors.white,size: 30,);
    return IconButton(onPressed: (onTap), icon: icon);

  }

  Icon _getIcon(ProgramUserState state, String buttonName){
    Icon iconLiked;
    Icon iconBookmarked;

    bool isIconLiked = ["like", "liked"].contains(buttonName);
    bool isIconBookmarked = ["bookmark", "bookmarked"].contains(buttonName);
    bool isProgramLiked = state is ProgramUserLoaded && state.isProgramLiked;
    bool isProgramRegister = state is ProgramUserLoaded && state.isProgramRegistered;

    iconLiked = Icon(iconMap[isProgramLiked ? "liked" : "like"]!,color: isProgramLiked ? Colors.red : Colors.white,size: 30,);
    iconBookmarked = Icon(iconMap[isProgramRegister ? "bookmarked" : "bookmark"]!,color: Colors.white,size: 30,);
    return isIconLiked ? iconLiked : isIconBookmarked ? iconBookmarked : Icon(iconMap[buttonName],color: Colors.white,size: 30,);
  }
}
