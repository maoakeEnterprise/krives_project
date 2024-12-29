import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/features/appbar/bloc/action_button/action_button_bloc.dart';
import 'package:krives_project/features/comment/page/comment_page.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/bloc_like_program/like_program_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';

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

    Map<String,VoidCallback> onTapMap = {
      "like":(){context.read<LikeProgramBloc>().add(LikeProgramEventPressed());},
      "liked":(){},
      "comment":(){showComment(context, themeChoice, langageChoice);},
      "share":(){},
      "bookmark":(){},
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

    VoidCallback? onTap = onTapMap[buttonName];
    return BlocBuilder<LikeProgramBloc, LikeProgramState>(
      builder: (context, state) {
        Icon icon;
        icon = _getLikeOrUnlike(context, state, buttonName);
        return IconButton(onPressed: (onTap), icon: icon);
  },
);
  }

  Icon _getLikeOrUnlike(BuildContext context, LikeProgramState state, String buttonName) {
    Icon icon;
    if(buttonName == "like"){
      icon = state is LikeProgramUnlike ? Icon(iconMap["like"],color: Colors.white,size: 30,) : Icon(iconMap["liked"],color: Colors.red,size: 30,);
    }
    else{
      icon = buttonName=="play" ? Icon(iconMap[buttonName],color: Colors.green,size: 60,) : Icon(iconMap[buttonName],color: Colors.white,size: 30,);
    }
    return icon;
  }
}
