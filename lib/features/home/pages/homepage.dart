import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/appbar_custom.dart';
import 'package:krives_project/core/theme/theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int chooseThemes = 0;
  int chooseLangage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: SourceLangage.titleHeaderPageLangage[0][chooseLangage]),
      backgroundColor: ThemeCustom.colorThemes[1][chooseThemes],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 24, 0, 0),
            child: Row(
              children: [
                Text(SourceLangage.titleHomePagesLangage[0][chooseLangage],style: ThemeCustom.textThemes[5][chooseThemes],),
                Container(width: 10,),
                Icon(Icons.mode_edit_outline_outlined,size: 20,color: ThemeCustom.colorThemes[7][chooseThemes],)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 24, 0, 0),
            child: Text(SourceLangage.titleHomePagesLangage[1][chooseLangage],style: ThemeCustom.textThemes[5][chooseThemes],),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 24, 0, 0),
            child: Text(SourceLangage.titleHomePagesLangage[2][chooseLangage],style: ThemeCustom.textThemes[5][chooseThemes],),
          ),
        ],
      ),
    );
  }
}
