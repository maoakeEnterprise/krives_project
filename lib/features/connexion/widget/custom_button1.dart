import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        log('team');
        log("${verifFormPage(textEditingController.length)}");
        log("${textEditingController.length}");
        if(verifFormPage(textEditingController.length)){
          log('team');
          if(verifyTextField(textEditingController['userName']!.text, textEditingController['password']!.text)){
            signInWithEmailAndPassword(context, textEditingController['userName']!.text, textEditingController['password']!.text);
          }
        }else{
          log('team');
          if(verifEmptyTextField(textEditingController['email']!.text)){
            sendPasswordResetEmail(context, textEditingController['email']!.text);
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
  Future<void> signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('User connected ');
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    } on FirebaseAuthException catch (e) {
      log('Error connexion : $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error connexion : $e')),
        );
      }
    } catch (e) {
      log('Error connexion : : $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error connexion : $e')),
        );
      }
    }
  }

  Future<void> sendPasswordResetEmail(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      log('E-mail to reset password sent');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'E-mail to reset password sent')),
        );
      }
    } on FirebaseAuthException catch (e) {
      log('Error to send e-mail : $e');
      String errorMessage = 'Error is coming '; // Default error message

      switch (e.code) {
        case 'auth/missing-email':
          errorMessage = 'Enter an email';
          break;
        case 'auth/invalid-email':
          errorMessage = 'Enter an valid email';
          break;
        case 'auth/user-not-found':
          errorMessage = 'No user found with this email';
          break;
      // Add more cases as needed for other potential errors

        default:
          errorMessage = 'An error occurred.';
          break;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (e) {
      log('Error to send e-mail : $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Unknow error')),
        );
      }
    }
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