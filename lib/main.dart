import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/appbar/bloc/action_button/action_button_bloc.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercice/exercice_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo_bloc.dart';
import 'package:krives_project/features/graphics/bloc/filter_bloc.dart';
import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:krives_project/features/hub_communautaire/bloc/sort_by/sort_by_bloc.dart';
import 'package:krives_project/features/menu/bloc/side_menu_tile_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/bloc_like_program/like_program_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/bloc_menu_widget/menu_widget_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/register_program/register_program_bloc.dart';
import 'package:krives_project/features/programme/create%20programme/bloc/edit_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/card_custom_exo/card_custom_exo_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/card_type_series/card_type_series_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/number_series_widget/number_series_widget_bloc.dart';
import 'package:krives_project/root_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> SwitchEditBloc()),
        BlocProvider(create: (context)=> MenuWidgetBloc()),
        BlocProvider(create: (context)=> LikeProgramBloc()),
        BlocProvider(create: (context)=> ActionButtonBloc()),
        BlocProvider(create: (context)=> SideMenuTileBloc()),
        BlocProvider(create: (context)=> TimerBloc()),
        BlocProvider(create: (context)=> CounterSeriesBloc()),
        BlocProvider(create: (context)=> EditBloc()),
        BlocProvider(create: (context)=> CardCustomExoBloc()),
        BlocProvider(create: (context)=> NumberSeriesWidgetBloc()),
        BlocProvider(create: (context)=> CardTypeSeriesBloc()),
        BlocProvider(create: (context)=> SwitchEditExoBloc()),
        BlocProvider(create: (context)=> SortByBloc()),
        BlocProvider(create: (context)=> RegisterProgramBloc()),
        BlocProvider(create: (context)=> FilterBloc()),
        BlocProvider(create: (context)=> ExerciceBloc()),
      ],
  child: RootApp(),
);
  }
}


