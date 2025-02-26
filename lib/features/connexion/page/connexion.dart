import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/data/repositories/background_color_custom1.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/features/connexion/widget/custom_button1.dart';
import 'package:krives_project/features/connexion/widget/textfield_theme1.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/connexion/widget/cardview_logo_connection.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  int chooseLangage = 0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    Map<String,TextEditingController> controllers = {
      'email': _emailController,
      'password': _passwordController
    };

    return Scaffold(
        body: BackgroundColorCustom1(
          child: Column(
              children: [

                CardViewLogoConnexion(),
                TextFieldTheme1(labelText: SourceLangage.baseLangage[3][chooseLangage],controller: _emailController,),// Pseudo
                TextFieldTheme1(labelText: SourceLangage.baseLangage[1][chooseLangage],controller: _passwordController,obscureText: true,),// Password
                CustomButton1(labelText: SourceLangage.baseLangage[12][chooseLangage],textEditingController: controllers,),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: 500
                  ),
                  margin: EdgeInsets.fromLTRB(55, 4, 41, 0),
                  child: Row(
                    children: [

                      GestureDetector(
                        child: Text(SourceLangage.baseLangage[9][chooseLangage], style: ThemesTextStyles.textNormalGreen,),
                        onTap: (){
                          navigateToPage(context, 'sign_up',RouteArgument());
                        },
                      ),//Sign in ?

                      GestureDetector(
                        child: Text(SourceLangage.baseLangage[10][chooseLangage], style: ThemesTextStyles.textNormalWhite,),
                        onTap: (){
                          navigateToPage(context, 'forgot_password',RouteArgument());
                        },
                      )//Forget password ?
                    ],
                  ),
                )
              ]
          ),
        ),
    );
  }
}
