import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/background_color_custom1.dart';
import 'package:krives_project/features/connexion/widget/custom_button1.dart';
import 'package:krives_project/features/connexion/widget/textfield_theme1.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import '../../../core/theme/themes_color.dart';

class SignUpPage extends StatefulWidget{
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int chooseLangage = 0;
  int _value = 1;

  @override
  Widget build(BuildContext context){

    TextEditingController pseudoController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    Map<String,TextEditingController> controllers = {
      'pseudo': pseudoController,
      'email': emailController,
      'name': nameController,
      'firstName': firstNameController,
      'phoneNumber': phoneNumberController,
      'password': passwordController,
      'confirmPassword': confirmPasswordController,
    };

    return Scaffold(
      body: BackgroundColorCustom1(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldTheme1(labelText: SourceLangage.baseLangage[0][chooseLangage],controller: pseudoController,),//Pseudo
              TextFieldTheme1(labelText: SourceLangage.baseLangage[3][chooseLangage],controller: emailController,),//Email
              TextFieldTheme1(labelText: SourceLangage.baseLangage[5][chooseLangage],controller: nameController,),//Name
              TextFieldTheme1(labelText: SourceLangage.baseLangage[6][chooseLangage],controller: firstNameController,),//First Name
              TextFieldTheme1(labelText: SourceLangage.baseLangage[7][chooseLangage],controller: phoneNumberController,),//Phone number
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      fillColor: WidgetStateProperty.all(ThemesColor.green1),
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) => setState(() => _value = value!),
                    ),
                    Text('M',style: ThemesTextStyles.textNormalWhite,),
                    Container(
                      width: 49,
                    ),
                    Radio(
                      fillColor: WidgetStateProperty.all(ThemesColor.green1),
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) => setState(() => _value = value!),
                    ),
                    Text('H',style: ThemesTextStyles.textNormalWhite,),
                  ],
                ),
              ),
              TextFieldTheme1(labelText: SourceLangage.baseLangage[1][chooseLangage],controller: passwordController,),//Password
              TextFieldTheme1(labelText: SourceLangage.baseLangage[2][chooseLangage],controller: confirmPasswordController,),//Re password
              CustomButton1(labelText: SourceLangage.baseLangage[8][chooseLangage],textEditingController: controllers,)//Confirm sign up
            ],
          )
      )
    );}
}