import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/background_color_custom1.dart';
import 'package:krives_project/features/connexion/widget/custom_button1.dart';
import 'package:krives_project/features/connexion/widget/textfield_theme1.dart';

class ForgotPasswordPage extends StatelessWidget{
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context){
    int chooseLangage = 0;
    TextEditingController emailController = TextEditingController();

    Map<String, TextEditingController> textEditingControllers = {
      "email": emailController,
    };

    return Scaffold(
      body: BackgroundColorCustom1(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldTheme1(labelText: SourceLangage.baseLangage[3][chooseLangage],controller: emailController,),//Email
            CustomButton1(labelText: SourceLangage.baseLangage[11][chooseLangage],textEditingController: textEditingControllers,)// Send
          ]
        )
      ),
    );
  }
}