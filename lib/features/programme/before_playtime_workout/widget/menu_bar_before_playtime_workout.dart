import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/bloc/bloc_menu_widget/menu_widget_bloc.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/icon_button_menu_before_playtime.dart';

class MenuBarBeforePlaytimeWorkout extends StatelessWidget {
  const MenuBarBeforePlaytimeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: BlocBuilder<MenuWidgetBloc, MenuWidgetState>(
        builder: (context, state) {
          List<Widget> children = _getMenuDependUser(context, state);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          );
          },
      ),
    );
  }

  List<Widget> _getMenuDependUser(BuildContext context, MenuWidgetState state){
    List<Widget> children = [
      IconButtonMenuBeforePlaytime(buttonName: "like"),
      IconButtonMenuBeforePlaytime(buttonName: "comment"),
      IconButtonMenuBeforePlaytime(buttonName: "share"),
    ];
    if(state is MenuWidgetUser) {
      children.add(IconButtonMenuBeforePlaytime(buttonName: "settingsProgram"));
      children.add(IconButtonMenuBeforePlaytime(buttonName: "play"));
    }
    else{
      children.add(IconButtonMenuBeforePlaytime(buttonName: "bookmark"));
    }
    return children;
  }

}
