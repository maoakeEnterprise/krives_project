

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/krives_user.dart';
import 'package:krives_project/features/authentification/services/auth_server_services.dart';
import 'package:krives_project/features/authentification/widget/bloc/auth_bloc.dart';
import 'package:krives_project/features/signup/bloc/radio_button_gender_bloc.dart';
import 'package:krives_project/features/signup/services/sign_up_function_services.dart';

class SignUpActionServices {
  static VoidCallback signUp(Map<String, TextEditingController> controller,RadioButtonGenderState state, BuildContext context){

    return (){
      int genderSelected = SignUpFunctionServices.getTheRightGender(state);
      Map<String,String> map = controller.map((key, value) => MapEntry(key, value.text));
      KrivesUser newUser = KrivesUser.createUser(map, genderSelected);
      String checkPassword = map["confirmPassword"]!;

      bool emptyTextFields = true;
      bool boolPassword;

      List<String> listUser = [
        newUser.pseudo,
        newUser.firstName,
        newUser.name,
        newUser.email,
        newUser.password,
      ];

      for(String data in listUser){
        emptyTextFields = AuthServerServices.verifEmptyTextField(data);
        if(emptyTextFields == false) break;
      }

      boolPassword = newUser.password == checkPassword ? true : false;
      emptyTextFields && boolPassword ? context.read<AuthBloc>().add(AuthSignedUp(krivesUser: newUser,context: context)) : null;

    };
    }
}