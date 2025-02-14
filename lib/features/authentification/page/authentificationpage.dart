import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krives_project/features/base/page/base_page.dart';
import 'package:krives_project/features/connexion/page/connexion.dart';

class Authentification extends StatelessWidget {
  const Authentification({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasData){
            return BasePage();
          }
          else if(snapshot.hasError){
            return const Center(child: Text("Error"),);
          }
          return ConnexionPage();
        }
    );
  }
}
