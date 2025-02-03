import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/mapping_menu_data.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/menu/bloc/side_menu_tile_bloc.dart';

class SideMenuTile extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final int index;

  const SideMenuTile({
    required this.onTap,
    required this.text,
    required this.index,
    super.key
  });


  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return BlocBuilder<SideMenuTileBloc, SideMenuTileState>(
      builder: (context, state) {
        return Container(
          decoration: _isSelectedBoxDecoration(themeChoice, state),
          margin: EdgeInsets.fromLTRB(0, 0, 15, 6),
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            iconColor: ThemesColor.themes[7][themeChoice],
            textColor: ThemesColor.themes[7][themeChoice],
            leading: MappingMenuData.mapMenuData[text] ?? Icon(Icons.error, color: Colors.red,), // manage error if not found icon
            title: Text(text,),
            onTap: onTap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        );
      },
    );
  }

  BoxDecoration _isSelectedBoxDecoration(int themeChoice, SideMenuTileState state){
    bool isSelected = false;
    if(state is SideMenuTileSelected){
      isSelected = state.index == index;
    }
    return BoxDecoration(
        color: ThemesColor.themes[1][themeChoice],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border.all(
          width: isSelected ? 1 : 0,
          color: isSelected ? ThemesColor.themes[4][themeChoice] : Colors.transparent
    )
    );
  }
}
