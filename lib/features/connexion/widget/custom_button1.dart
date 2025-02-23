import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/user_service.dart';
import 'package:krives_project/core/theme/themes_color.dart';

import '../../../core/theme/themes_text_styles.dart';

class CustomButton1 extends StatelessWidget {
  final String? labelText;
  final Map<String, TextEditingController> textEditingController;

  const CustomButton1(
      {super.key, required this.labelText, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UserService userService = UserService();
        if(verifFormPage(textEditingController.length)){
          if(verifyTextField(textEditingController['userName']!.text, textEditingController['password']!.text)){
            userService.signInWithEmailAndPassword(context, textEditingController['userName']!.text, textEditingController['password']!.text);
          }
        }else{
          if(verifEmptyTextField(textEditingController['email']!.text)){
            userService.sendPasswordResetEmail(context, textEditingController['email']!.text);
          }
        }


      },
      child: Ink(
        child: Container(
          margin: EdgeInsets.fromLTRB(41, 0, 41, 0),
          height: 43,
          constraints: BoxConstraints(
              maxWidth: 500
          ),
          decoration: BoxDecoration(
            color: ThemesColor.green1,
            borderRadius: BorderRadius.circular(21.5),
          ),
          child: Center(
            child: Text(labelText!,
              style: ThemesTextStyles.textBigBoldBlack,
            ),
          ),
        ),
      ),
    );
  }

  bool verifyTextField(String email, String password){
    return verifEmptyTextField(email) && verifEmptyTextField(password) ? true : false;
  }
  bool verifEmptyTextField(String text) {
    if (text.trim().isEmpty || text.contains(RegExp(r'\s+'))) {
      return false;
    }
    return true;
  }

  bool verifFormPage(int lengthMap){
    return lengthMap == 2 ? true : false;
  }
}