import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/appbar/bloc/action_button/action_button_bloc.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo_bloc.dart';
import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:krives_project/features/menu/bloc/side_menu_tile_bloc.dart';
import 'package:krives_project/features/menu/widget/header_menu.dart';
import 'package:krives_project/features/menu/widget/side_menu_tile.dart';

class MenuPage extends StatelessWidget {
  final Function(int) onPageSelected;
  const MenuPage({
    super.key,
    required this.onPageSelected
  });

  @override
  Widget build(BuildContext context) {

    int langageChoice = 0;
    int themesChoice = 0;

    //action for the bloc who will be called when the user click on a menu item
    initialState() => context.read<SwitchEditBloc>().add(SwitchEditEventMenuPressed());
    stateActionButton() => context.read<ActionButtonBloc>().add(ActionButtonPressed());
    stateExercice() => context.read<ActionButtonBloc>().add(ActionButtonExercicePressed());
    stateMenuButton(int index) => context.read<SideMenuTileBloc>().add(SideMenuTilePressed(index));
    stateInitEditExercice() => context.read<SwitchEditExoBloc>().add(SwitchEditExoEventInitPressed());

    List<Function> onTap = [//list of functions who will be called when the user click on a menu item
          (){stateActionButton();onPageSelected(0);stateMenuButton(0);},
          (){initialState();stateActionButton();onPageSelected(1);stateMenuButton(1);},
          (){initialState();stateInitEditExercice();stateExercice();onPageSelected(2);stateMenuButton(2);},
          (){initialState();stateActionButton();onPageSelected(3);stateMenuButton(3);},
          (){initialState();stateActionButton();onPageSelected(0);stateMenuButton(4);},
          (){initialState();stateActionButton();onPageSelected(0);stateMenuButton(5);},
          (){initialState();stateActionButton();onPageSelected(4);stateMenuButton(6);},
    ];

    List<String> titleMenu = [
      SourceLangage.titleMenuLangage[0][langageChoice],
      SourceLangage.titleMenuLangage[1][langageChoice],
      SourceLangage.titleMenuLangage[2][langageChoice],
      SourceLangage.titleMenuLangage[3][langageChoice],
      SourceLangage.titleMenuLangage[4][langageChoice],
      SourceLangage.titleMenuLangage[5][langageChoice],
      SourceLangage.titleMenuLangage[6][langageChoice],
    ];

    return Drawer(
      backgroundColor: ThemesColor.blackColor3,
      child: ListView(
        children: [
          HeaderMenu(),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 21),
            child: Divider(
              color: ThemesColor.themes[1][themesChoice],
            ),
          ),
          SideMenuTile(text: titleMenu[0],onTap: (){onTap[0]();},index: 0,),
          SideMenuTile(text: titleMenu[1],onTap: (){onTap[1]();},index: 1,),
          SideMenuTile(text: titleMenu[2],onTap: (){onTap[2]();},index: 2,),
          SideMenuTile(text: titleMenu[3],onTap: (){onTap[3]();},index: 3,),
          SideMenuTile(text: titleMenu[4],onTap: (){onTap[4]();},index: 4,),
          SideMenuTile(text: titleMenu[5],onTap: (){onTap[5]();},index: 5,),
          SideMenuTile(text: titleMenu[6],onTap: (){onTap[6]();},index: 6,),
        ],
      ),
    );
  }
}
