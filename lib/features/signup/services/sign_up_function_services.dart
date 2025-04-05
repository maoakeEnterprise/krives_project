import 'package:krives_project/features/signup/bloc/radio_button_gender_bloc.dart';

class SignUpFunctionServices{


  ///this function is here to get the gender who is represented by a number 0 : for WOMAN and 1 : for MAN
  ///we init the gender to 1 like default gender for pre-select the gender.
  static int getTheRightGender(RadioButtonGenderState state){
    int genderSelected = 1;
    if(state is RadioButtonGenderSelected){
      genderSelected = state.gender;
    }
    return genderSelected;
  }
}