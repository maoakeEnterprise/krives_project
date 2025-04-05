
import 'package:flutter/material.dart';
import 'package:krives_project/features/profil/services/profile_action_services.dart';

class ProfileFunctionServices {

  ///this function is here to see if the button is a confirm button or not
  ///if its true so we need to implement the function who will call the function who will delete the account
  ///if its false so we need to close the PopUp
  static VoidCallback isTheFunctionConfirmButtonOrNot(bool isConfirmButtonOrNot, BuildContext context){

    return isConfirmButtonOrNot ? ProfileActionServices.deleteAccount(context)
        :
        ProfileActionServices.popClosed(context);
  }
}