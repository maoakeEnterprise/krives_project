import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/background_color_custom1.dart';
import 'package:krives_project/features/connexion/widget/custom_button1.dart';
import 'package:krives_project/features/connexion/widget/textfield_theme1.dart';

class ForgotPasswordPage extends StatefulWidget{
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  int chooseLangage = 0;
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){


    Map<String, TextEditingController> textEditingControllers = {
      "email": _emailController,
    };

    return Scaffold(
      body: BackgroundColorCustom1(
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40),
                child: IconButton(
                    onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldTheme1(labelText: SourceLangage.baseLangage[3][chooseLangage],controller: _emailController,),//Email
                CustomButton1(labelText: SourceLangage.baseLangage[11][chooseLangage],textEditingController: textEditingControllers,)// Send
              ]
            ),
          ],
        )
      ),
    );
  }
}