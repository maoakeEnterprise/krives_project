import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/features/base/page/base_page.dart';
import 'package:krives_project/features/connexion/page/connexion.dart';

import '../widget/bloc/auth_bloc.dart';

class Authentification extends StatelessWidget {
  const Authentification({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {

          if(state is AuthLoading){return Scaffold(body: const Center(child: CircularProgressIndicator(),));}
          if(state is AuthSuccess){return BasePage();}
          return ConnexionPage();

          },

        listener: (context,state){

          if(state is AuthError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessages,style: const TextStyle(color: Colors.black),),
              backgroundColor: Colors.red.withValues(alpha: 0.5),
            )
            );
          }

        }
    );
  }
}
