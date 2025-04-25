import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/background_color_custom1.dart';
import 'package:krives_project/core/theme/theme.dart';
import 'package:krives_project/features/base/bloc/base_page/data_user_bloc.dart';
import 'package:krives_project/features/base/services/base_page_service.dart';
import 'package:krives_project/features/menu/services/menu_function_services.dart';
import 'package:krives_project/features/menu/page/menu_page.dart';
class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  final int _chooseThemes = 0;
  final int _chooseLangage = 0;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<DataUserBloc>().add(LoadDataUser());
  }


  void _updatePage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    String titleMenu = SourceLangage.baseLangage[21][_chooseLangage];
    return BlocConsumer<DataUserBloc,DataUserState>(
        builder: (context, state){
          if(state is DataUserLoading || state is DataUserError){
            return Scaffold(
              body: BackgroundColorCustom1(
                  child: Center(
                      child: CircularProgressIndicator())
              ),
            );
          }
          if(state is DataUserLoaded){
            if(state.user.id.isEmpty){
              return Scaffold(
                body: BackgroundColorCustom1(
                    child: Center(
                        child: CircularProgressIndicator())
                ),
              );
            }
            return Scaffold(
              appBar: BasePageService.getTheRightAppBarCustom(MenuFunctionServices.mapPages[_selectedPageIndex][titleMenu],_selectedPageIndex),
              backgroundColor: ThemeCustom.colorThemes[1][_chooseThemes],
              drawer: MenuPage(onPageSelected: _updatePage,userSport: state.user,),
              body: MenuFunctionServices.mapPages[_selectedPageIndex]['body'],
            );
          }
          return Container();
        }, listener: (context,state){

        });
  }
}
