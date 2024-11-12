import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/features/appbar/page/appbar_custom.dart';
import 'package:krives_project/core/theme/theme.dart';
import 'package:krives_project/features/home/pages/home_page.dart';
import 'package:krives_project/features/menu/page/menu_page.dart';
import 'package:krives_project/features/profil/page/profil_settings_page.dart';
import 'package:krives_project/features/programme/create%20programme/page/create_programme_page.dart';
import 'package:krives_project/features/programme/programme%20series/page/programme_series.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int chooseThemes = 0;
  int chooseLangage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: SourceLangage.titleHeaderPageLangage[0][chooseLangage]),
      backgroundColor: ThemeCustom.colorThemes[1][chooseThemes],
      drawer: MenuPage(),
      body: ProgrammeSeries(),
    );
  }
}
