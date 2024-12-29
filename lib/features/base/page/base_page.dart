import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/mapping_root.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/appbar/page/appbar_custom.dart';
import 'package:krives_project/core/theme/theme.dart';
import 'package:krives_project/features/menu/page/menu_page.dart';
class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  final MappingRoot mappingRoot = MappingRoot();
  final int _chooseThemes = 0;
  final int _chooseLangage = 0;
  int _selectedPageIndex = 0;

  void _updatePage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    String titleMenu = SourceLangage.baseLangage[21][_chooseLangage];
    return Scaffold(
      appBar: AppBarCustom(title: mappingRoot.pages[_selectedPageIndex][titleMenu],),
      backgroundColor: ThemeCustom.colorThemes[1][_chooseThemes],
      drawer: MenuPage(onPageSelected: _updatePage,),
      body: mappingRoot.pages[_selectedPageIndex]['body'],
    );
  }
}
