import 'package:flutter/material.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/icon_button_menu_before_playtime.dart';

class MenuBarBeforePlaytimeWorkout extends StatelessWidget {
  const MenuBarBeforePlaytimeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = _getMenuDependUser(context);
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    ),
    );
  }

  List<Widget> _getMenuDependUser(BuildContext context){
    List<Widget> children = [
      IconButtonMenuBeforePlaytime(buttonName: "like"),
      IconButtonMenuBeforePlaytime(buttonName: "comment"),
      IconButtonMenuBeforePlaytime(buttonName: "share"),
    ];
    if(false){
      if(true){
        children.add(IconButtonMenuBeforePlaytime(buttonName: "settingsProgram"));
        children.add(IconButtonMenuBeforePlaytime(buttonName: "play"));
      }
      else{
        children.add(IconButtonMenuBeforePlaytime(buttonName: "bookmark"));
        if(false) {
          children.add(IconButtonMenuBeforePlaytime(buttonName: "play"));
        }
      }
    }
    return children;
  }

}
