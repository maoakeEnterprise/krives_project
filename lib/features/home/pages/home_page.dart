import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/services_action/button_action_services.dart';
import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:krives_project/features/home/widget/card_custom_home.dart';
import 'package:krives_project/core/data/repositories/widget_scroll.dart';
import 'package:krives_project/features/home/widget/title_widget_v2.dart';
import 'package:krives_project/features/home/widget/title_wiget_v1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int chooseThemes = 0;
  final int chooseLangage = 0;
  EdgeInsets widgetScrollIsWorkOut = EdgeInsets.fromLTRB(10, 10, 10, 24);

  @override
  Widget build(BuildContext context) {

    return ListView(
        children: [

          ///This bloc manage the button to change icon if he want to have
          /// an icon to edit his program or delete his program in the
          ///CardCustomHome widget
          BlocBuilder<SwitchEditBloc, SwitchEditState>(
            builder: (context, state) {
              IconData icon;
              icon = state is SwitchEditStateOff ? Icons.mode : Icons.arrow_back_ios_new;
              return TitleWidgetV2(text: SourceLangage.titleHomePagesLangage[0][chooseLangage], icon: icon);
              },
          ),

          ///Widget with the programs of the user
          WidgetScroll(
            cardCustom: CardCustomHome(
              onTap: ButtonActionServices.navigateInTheProgram(context),
              isCanBeEditByTheUserInTheHomePage: true,
              isOwnedByTheUser: true,
            ),
            height: 214,
            itemCount: 4,
            padding: widgetScrollIsWorkOut,
            ),

          ///Widget with the favorite programs of the user
          TitleWidgetV1(text:SourceLangage.titleHomePagesLangage[1][chooseLangage]),
          WidgetScroll(
            cardCustom: CardCustomHome(isOwnedByTheUser: true,),
            height: 214,
            itemCount: 3,
            padding: widgetScrollIsWorkOut,
          ),

          ///Widget with the trending programs workout to the community
          TitleWidgetV1(text:SourceLangage.titleHomePagesLangage[2][chooseLangage]),
          WidgetScroll(cardCustom: CardCustomHome(
          ),
            height: 214,
            itemCount: 9,
            padding: widgetScrollIsWorkOut,
          ),
        ],
      );
  }
}
