import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/background_color_custom1.dart';
import 'package:krives_project/features/connexion/widget/custom_button1.dart';
import 'package:krives_project/features/connexion/widget/textfield_theme1.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    int chooseLangage = 0;

    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    Map<String,TextEditingController> controllers = {
      'newPassword': passwordController,
      'confirmNewPassword': confirmPasswordController,
    };

    return Scaffold(
      body: BackgroundColorCustom1(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldTheme1(labelText: SourceLangage.baseLangage[4][chooseLangage],controller: passwordController,),//New password
            TextFieldTheme1(labelText: SourceLangage.baseLangage[2][chooseLangage],controller: confirmPasswordController,),//Confirm Password
            CustomButton1(labelText: SourceLangage.baseLangage[11][chooseLangage],textEditingController: controllers,)// Send
          ]
        ),
      ),
    );
  }
}