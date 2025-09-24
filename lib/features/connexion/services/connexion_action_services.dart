import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/authentification/widget/bloc/auth_bloc.dart';

class ConnexionActionServices{


  ///Action button who call the AuthBloc who is here to manage the SignIn and reset the password with an email.
  ///the map is here to see if the map we send is with the email and the password or if its with juste the email.
  ///if its the email with password the function will recognize : user trying to connect to his account.
  ///if its just the email the function will recognize : user forgot his password so he want to reset this.
  static void connexionOrResetPassword(Map<String,String> map, BuildContext context){
    if(map.length == 2){
      context.read<AuthBloc>().add(AuthSignedIn(email: map['email']!, password: map['password']!,));
    }else{
      context.read<AuthBloc>().add(AuthResetEmail(email: map['email']!,context: context));
    }
  }
}