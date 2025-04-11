import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/base/bloc/base_page/data_user_bloc.dart';
import 'package:krives_project/features/exercice/create%20exercice/bloc/exercise_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/bloc_exercise_services/exercise_serv_bloc.dart';
import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:krives_project/features/profil/pop_up_dialog/pop_up_delete_account/bloc/pop_delete_account_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/program_before_work_out_bloc/program_before_work_out_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/folder_bloc/folder_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_bloc/program_bloc.dart';
import 'package:krives_project/features/programme/program_user/bloc/switch_edit_programs_bloc/switch_edit_programs_bloc.dart';
import 'features/appbar/bloc/action_button/action_button_bloc.dart';
import 'features/authentification/widget/bloc/auth_bloc.dart';
import 'features/appbar/bloc/switch_edit_app_bar/switch_edit_app_bar_bloc.dart';
import 'features/graphics/bloc/filter_bloc.dart';
import 'features/hub_communautaire/bloc/sort_by/sort_by_bloc.dart';
import 'features/menu/bloc/side_menu_tile_bloc.dart';
import 'features/programme/create programme/bloc/edit_bloc.dart';
import 'features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';
import 'features/programme/programme series/bloc/card_custom_exo/card_custom_exo_bloc.dart';
import 'features/programme/programme series/bloc/card_type_series/card_type_series_bloc.dart';
import 'features/programme/programme series/bloc/number_series_widget/number_series_widget_bloc.dart';
import 'features/signup/bloc/radio_button_gender_bloc.dart';

class AllBlocsProvider extends StatelessWidget {
  final Widget child;

  const AllBlocsProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchEditBloc()),
        BlocProvider(create: (context) => ActionButtonBloc()),
        BlocProvider(create: (context) => SideMenuTileBloc()),
        BlocProvider(create: (context) => TimerBloc()),
        BlocProvider(create: (context) => CounterSeriesBloc()),
        BlocProvider(create: (context) => EditBloc()),
        BlocProvider(create: (context) => CardCustomExoBloc()),
        BlocProvider(create: (context) => NumberSeriesWidgetBloc()),
        BlocProvider(create: (context) => CardTypeSeriesBloc()),
        BlocProvider(create: (context) => SwitchEditAppBarBloc()),
        BlocProvider(create: (context) => SortByBloc()),
        BlocProvider(create: (context) => FilterBloc()),
        BlocProvider(create: (context) => RadioButtonGenderBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => PopDeleteAccountBloc()),
        BlocProvider(create: (context) => DataUserBloc()),
        BlocProvider(create: (context) => ExerciseServBloc()),
        BlocProvider(create: (context) => ExerciseBloc()),
        BlocProvider(create: (context) => FolderBloc()),
        BlocProvider(create: (context) => ProgramBloc()),
        BlocProvider(create: (context) => SwitchEditProgramsBloc()),
        BlocProvider(create: (context) => ProgramBeforeWorkOutBloc())
      ],
      child: child,
    );
  }
}
