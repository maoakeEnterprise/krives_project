import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/services_action/button_action_services.dart';
import 'package:krives_project/features/comment/page/comment_page.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/register_program/register_program_bloc.dart';
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

    void onLikeTap(Program program, String idUser){
    }
    void onRegisterTap(Program program, String idUser){}

    Map<String,VoidCallback> onTapMap = {
      "like":(){},
      "liked":(){},
      "comment":(){showComment(context, themeChoice, langageChoice);},
      "share":(){},
      "bookmark":(){context.read<RegisterProgramBloc>().add(RegisterProgramPressed());},
      "bookmarked":(){},
      "settingsProgram":(){
        ButtonActionServices.navigateToPage(context, 'program', RouteArgument(idWordTitle: 7,isProgramButton: true));
        },
      "play":(){
        ButtonActionServices.navigateToPage(context, 'workout_playtime', RouteArgument(titlePage: "Nom Programme"));
        context.read<CounterSeriesBloc>().add(CounterSerieReset());
        context.read<TimerBloc>().add(TimerFinishedSeriesPressed());
      }
    };
    return Container();

  }
}
