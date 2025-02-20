import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/profil/widget/card__custom_profiles_settings.dart';

class WidgetConnexion extends StatelessWidget {
  const WidgetConnexion({super.key});

  @override
  Widget build(BuildContext context) {
    int langageChoice = 0;
    int themeChoice = 0;
    return CardCustomProfileSettings(
      child: Column(
        children: [
          ListTile(
            onTap: () async {
              await signOut(context);
            },
            title: Text(
              SourceLangage.titleProfileLangage[12][langageChoice],
              style: ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.logout_rounded),
            iconColor: ThemesColor.themes[5][themeChoice],
          ),
          ListTile(
            onTap: () {
            },
            title: Text(
              SourceLangage.titleProfileLangage[13][langageChoice],
              style: ThemesTextStyles.themes[3][themeChoice],
            ),
            leading: Icon(Icons.delete_forever),
            iconColor: ThemesColor.themes[5][themeChoice],
          )
        ],
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    // TODO: implement signOut
    try{
      await FirebaseAuth.instance.signOut();
      log("User Deconnected");
      if(context.mounted){
        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      }
    }
    on FirebaseAuthException catch(e){
      log('Error during the connexion : $e');
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error during the connexion : $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
    catch(e){
      log('Error during the connexion : $e');
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error during the connexion : $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
