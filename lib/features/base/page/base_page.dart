import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/user_sport.dart';
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
  final userId = FirebaseAuth.instance.currentUser!.uid;


  void _updatePage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var infoUser = FirebaseFirestore.instance.collection('users').where("id", isEqualTo: userId).snapshots();
    String titleMenu = SourceLangage.baseLangage[21][_chooseLangage];
    return StreamBuilder(
      stream: infoUser,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          var list = snapshot.data!.docs.map((doc) => doc.data()).toList();
          UserSport userSport = UserSport.fromMap(list[0]);

          return Scaffold(
            appBar: AppBarCustom(title: mappingRoot.pages[_selectedPageIndex][titleMenu],),
            backgroundColor: ThemeCustom.colorThemes[1][_chooseThemes],
            drawer: MenuPage(onPageSelected: _updatePage,userSport: userSport,),
            body: mappingRoot.pages[_selectedPageIndex]['body'],
          );
        }
        return Container();
      }
    );
  }
}
