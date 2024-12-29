

import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/mapping_root.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';

void navigateToPage(BuildContext context, String routeName, RouteArgument routeArgument) {
  if(routeName.isNotEmpty) {
    Navigator.pushNamed(context,  MappingRoot.namePageRoot[routeName]!,arguments: routeArgument);
  }
  else {
    debugPrint('Route not found for: $routeName');
  }
}