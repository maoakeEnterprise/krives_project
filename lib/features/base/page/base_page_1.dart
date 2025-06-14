import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/argument/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/services/function_services.dart';
import 'package:krives_project/core/theme/theme.dart';
import 'package:krives_project/features/appbar/page/appbar_custom.dart';
import 'package:krives_project/features/programme/s_global_bloc/series/series_bloc.dart';

class BasePage1 extends StatelessWidget {
  final Widget child;

  const BasePage1({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;
    int chooseLangage = 0;
    String title;
    final arguments = FunctionServices.getArgument(context);

    title = _getTitlePage(arguments, chooseLangage);
    return BlocBuilder<SeriesBloc, SeriesState>(
      builder: (context, state) {
        if (state is SeriesLoaded) {

        }
        return Scaffold(
          appBar: AppBarCustom(
            title: title,
            isCheckExerciseButton: arguments.isCheckExerciseButton,
            isCheckSeriesButton: arguments.isCheckSeriesButton,
            isCheckProgramButton: arguments.isCheckProgramButton,
            isEditProgramsButton: arguments.isEditProgramsButton,
            isEditFolderProgram: arguments.isEditExerciseButton,
            isEditExercise: arguments.isEditExerciseButton,
            isInProgram: arguments.isInProgram,
          ),
          backgroundColor: ThemeCustom.colorThemes[1][chooseThemes],
          body: child,
        );
      },
    );
  }


  String _getTitlePage(RouteArgument routeArgument, int chooseLangage) {
    String title = '';
    if (routeArgument.idWordTitle != null) {
      title = SourceLangage.titleHeaderPageLangage[routeArgument
          .idWordTitle!][chooseLangage];
    }
    else if (routeArgument.titlePage != null && !routeArgument.isInProgram) {
      title = routeArgument.titlePage!;
    }
    else {
      title = '';
    }
    return title;
  }
}


