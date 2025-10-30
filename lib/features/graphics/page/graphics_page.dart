import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/graphics/bloc/graphics_bloc/graphics_data_bloc.dart';
import 'package:krives_project/features/graphics/services/graphics_services.dart';
import 'package:krives_project/features/graphics/widget/graph_widget.dart';
import 'package:krives_project/features/graphics/widget/time_select_widget_graphics.dart';
import 'package:krives_project/features/graphics/widget/title_left_widget.dart';
import 'package:krives_project/features/graphics/widget/title_top_widget.dart';
import 'package:krives_project/features/graphics/widget/title_widget_graphics.dart';
import 'package:krives_project/features/graphics/widget/widget_scroll_graphics.dart';

class GraphicsPage extends StatefulWidget {
  const GraphicsPage({super.key});

  @override
  State<GraphicsPage> createState() => _GraphicsPageState();
}

class _GraphicsPageState extends State<GraphicsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GraphicsDataBloc>().add(GetGraphicsDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    //int themeChoice = 0;
    int langageChoice = 0;
    return ListView(
      children: [
        TitleTopWidget(),
        GraphWidget(),
        TitleLeftWidget(),
        SizedBox(height: 15,),
        BlocConsumer<GraphicsDataBloc, GraphicsDataState>(
          listener: (context, state) {
            if(state is GraphicsDataError){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(GraphicsServices.getErrorMessage(state))));
            }
          },
          builder: (context, state) {
            if(state is GraphicsDataLoaded) {
                return WidgetScrollGraphics(
                  exercises: GraphicsServices.getExercise(state),
                  exerciseSelected: GraphicsServices.getExerciseSelected(state),
                );
            }
            return Container();
          },
        ),
        TitleWidgetGraphics(
          title: SourceLangage.titleGraphicsPage[3][langageChoice],
          marginLeft: 26,
          marginTop: 15,
        ),
        SizedBox(height: 14,),
        TimeSelectWidgetGraphics(),
      ],
    );
  }
}
