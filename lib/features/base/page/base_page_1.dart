import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/theme.dart';
import 'package:krives_project/features/appbar/page/appbar_custom.dart';

class BasePage1 extends StatelessWidget {
  final Widget child;
  const BasePage1({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;
    int chooseLangage = 0;
    String title;
    final arguments = ModalRoute.of(context)?.settings.arguments as RouteArgument;
    title = _getTitlePage(arguments,chooseLangage);
    return Scaffold(
      appBar: AppBarCustom(
        title: title,
        isCreateButton: arguments.isCreateButton,
        isProgramButton: arguments.isProgramButton,
      ),
      backgroundColor: ThemeCustom.colorThemes[1][chooseThemes],
      body: child,
    );
  }


  String _getTitlePage(RouteArgument routeArgument,int chooseLangage){
    String title = '';
    if(routeArgument.idWordTitle != null){
      title = SourceLangage.titleHeaderPageLangage[routeArgument.idWordTitle!][chooseLangage];
    }
    else if(routeArgument.titlePage != null){
      title = routeArgument.titlePage!;
    }
    else{
      title='[Name not found]';
    }
    return title;
  }
}

