import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/krives_user.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/services/menu_services.dart';
import 'package:krives_project/features/menu/widget/header_menu.dart';
import 'package:krives_project/features/menu/widget/side_menu_tile.dart';

class MenuPage extends StatefulWidget {
  final Function(int) onPageSelected;
  final KrivesUser userSport;
  const MenuPage({
    super.key,
    required this.onPageSelected,
    required this.userSport
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int langageChoice = 0;
  int themeChoice = 0;

  @override
  Widget build(BuildContext context) {


    return Drawer(
      backgroundColor: ThemesColor.blackColor3,
      child: ListView.builder(
          itemCount: MenuServices.mapPages.length,
          itemBuilder:(context,index){
            if(index == 0){
              return HeaderMenu(name: widget.userSport.name, firstName: widget.userSport.firstName);
            }
            return SideMenuTile(
                onTap: (){
                  widget.onPageSelected(index);
                  MenuServices.listFunctionsMenu[index](context,index);
                },
                text: SourceLangage.titleMenuLangage[index-1][langageChoice],
                index: index);
          }
      ),
    );
  }
}
