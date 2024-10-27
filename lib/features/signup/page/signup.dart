import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/background_color_custom1.dart';
import 'package:krives_project/core/data/repositories/custom_button1.dart';
import 'package:krives_project/core/data/repositories/textfield_theme1.dart';
import 'package:krives_project/core/data/datasrouces/text_styles_custom.dart';
import '../../../core/data/datasrouces/colors_custom.dart';

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
    return Scaffold(
      body: BackgroundColorCustom1(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldTheme1(labelText: SourceLangage.baseLangage[0][chooseLangage]),//Pseudo
              TextFieldTheme1(labelText: SourceLangage.baseLangage[3][chooseLangage]),//Email
              TextFieldTheme1(labelText: SourceLangage.baseLangage[5][chooseLangage]),//Name
              TextFieldTheme1(labelText: SourceLangage.baseLangage[6][chooseLangage]),//First Name
              TextFieldTheme1(labelText: SourceLangage.baseLangage[7][chooseLangage]),//Phone number
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
              TextFieldTheme1(labelText: SourceLangage.baseLangage[1][chooseLangage]),//Password
              TextFieldTheme1(labelText: SourceLangage.baseLangage[2][chooseLangage]),//Re password
              CustomButton1(labelText: SourceLangage.baseLangage[8][chooseLangage])//Confirm sign up
            ],
          )
      )
    );}
}