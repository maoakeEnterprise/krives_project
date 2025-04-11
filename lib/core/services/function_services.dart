import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';

class FunctionServices {

  static RouteArgument getArgument(BuildContext context){
    return ModalRoute.of(context)?.settings.arguments as RouteArgument;
  }

  static void showSnackBar(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
            Text("Something is wrong you should look this message he will help you tu debug this error: $message")
        ));

  }

}