import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/mapping_root.dart';

class ButtonActionServices{

  static void navigateToPage(BuildContext context, String routeName, RouteArgument routeArgument) {
    if(routeName.isNotEmpty) {
      Navigator.pushNamed(context,  MappingRoot.namePageRoot[routeName]!,arguments: routeArgument);
    }
    else {
      debugPrint('Route not found for: $routeName');
    }
  }

  static VoidCallback closePopUp(BuildContext context){
    return () => Navigator.of(context).pop();
  }

  ///HomePageActionButton

  static VoidCallback navigateInTheProgram(BuildContext context){
    return () => navigateToPage(context, 'program', RouteArgument(idWordTitle: 7,isProgramButton: true));
  }

  ///ProgramActionServices

}