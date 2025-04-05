import 'package:flutter/cupertino.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';

class FunctionServices {

  static RouteArgument getArgument(BuildContext context){
    return ModalRoute.of(context)?.settings.arguments as RouteArgument;
  }

}