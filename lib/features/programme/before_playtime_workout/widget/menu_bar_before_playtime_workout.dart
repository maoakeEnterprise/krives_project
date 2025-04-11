import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/programme/before_playtime_workout/services/berfore_playtime_services.dart';
import 'package:krives_project/features/programme/before_playtime_workout/widget/icon_button_menu_before_playtime.dart';

class MenuBarBeforePlaytimeWorkout extends StatelessWidget {
  final Program program;
  const MenuBarBeforePlaytimeWorkout({super.key, required this.program});

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

  List<Widget> _getMenuDependUser(BuildContext context) {
    List<Widget> children = [];

    for (var button in BeforePlaytimeServices.getTheRightMenu(program)!) {
      children.add(
        IconButtonMenuBeforePlaytime(buttonName: button),
      );
    }
    return children;
  }
}
