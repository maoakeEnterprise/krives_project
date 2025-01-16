import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:krives_project/features/home/widget/card_custom_home.dart';
import 'package:krives_project/core/data/repositories/widget_scroll.dart';
import 'package:krives_project/features/home/widget/title_widget_v2.dart';
import 'package:krives_project/features/home/widget/title_wiget_v1.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/bloc_menu_widget/menu_widget_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int chooseThemes = 0;
  final int chooseLangage = 0;

  @override
  Widget build(BuildContext context) {

    return ListView(
        children: [
          BlocBuilder<SwitchEditBloc, SwitchEditState>(
            builder: (context, state) {
              IconData icon;
              icon = state is SwitchEditStateOff ? Icons.mode : Icons.arrow_back_ios_new;
              return TitleWidgetV2(text: SourceLangage.titleHomePagesLangage[0][chooseLangage], icon: icon);
              },
          ),
          WidgetScroll(cardCustom: CardCustomHome(
            onTap: (){
              navigateToPage(context, 'program', RouteArgument(idWordTitle: 7,isProgramButton: true));
              },
            onTap2: (){_onTap(context, 'before_workout_playtime', RouteArgument(titlePage: "Nom Programme"), true);},
            isEdit: true,
          ),
            height: 214, itemCount: 4, left: 10, top: 10, right: 10, bottom: 24
            ,),
          TitleWidgetV1(text:SourceLangage.titleHomePagesLangage[1][chooseLangage]),
          WidgetScroll(cardCustom: CardCustomHome(
            onTap2: (){_onTap(context, 'before_workout_playtime', RouteArgument(titlePage: "Nom Programme"),true);},
          ),
            height: 214, itemCount: 3, left: 10, top: 10, right: 10, bottom: 24,),
          TitleWidgetV1(text:SourceLangage.titleHomePagesLangage[2][chooseLangage]),
          WidgetScroll(cardCustom: CardCustomHome(
            onTap2: (){_onTap(context, 'before_workout_playtime', RouteArgument(titlePage: "Nom Programme"),false);},
          ),
            height: 214, itemCount: 9, left: 10, top: 10, right: 10, bottom: 24,),
        ],
      );
  }

  void _onTap(BuildContext context, String routeName, RouteArgument routeArgument, bool isUser) {
    context.read<SwitchEditBloc>().add(SwitchEditEventInitPressed());
    if(isUser){
      context.read<MenuWidgetBloc>().add(MenuWidgetEventUserPressed());
    }
    else{
      context.read<MenuWidgetBloc>().add(MenuWidgetEventHubPressed());
    }
    navigateToPage(context, routeName, routeArgument);
  }
}
