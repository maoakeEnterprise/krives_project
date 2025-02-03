import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/theme_data.dart';
import 'package:krives_project/features/base/page/base_page.dart';
import 'package:krives_project/features/base/page/base_page_1.dart';
import 'package:krives_project/features/connexion/page/connexion.dart';
import 'package:krives_project/features/connexion/page/forgot_password_page.dart';
import 'package:krives_project/features/connexion/page/new_password_page.dart';
import 'package:krives_project/features/exercice/create%20exercice/page/create_exercise_page.dart';
import 'package:krives_project/features/programme/before_playtime_workout/page/before_playtime_workout_page.dart';
import 'package:krives_project/features/programme/create%20programme/page/create_programme_page.dart';
import 'package:krives_project/features/programme/playtime_workout/page/playtime_workout_page.dart';
import 'package:krives_project/features/programme/program_user/page/programs_user.dart';
import 'package:krives_project/features/programme/programme%20series/page/programme_series.dart';
import 'package:krives_project/features/signup/page/signup.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const BasePage(),
        '/sign_page': (context) => const SignUpPage(),
        '/exercise': (context) => const BasePage1(child: CreateExercisePage()),
        '/program': (context) => const BasePage1(child: CreateProgrammePage()),
        '/series': (context) => const BasePage1(child: ProgrammeSeries()),
        '/workout_playtime': (context) => const BasePage1(child: PlaytimeWorkoutPage()),
        '/before_workout_playtime': (context) => const BasePage1(child: BeforePlaytimeWorkoutPage()),
        '/home': (context) => const BasePage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/new_password': (context) => const NewPasswordPage(),
        '/file_program': (context) =>const BasePage1(child: ProgramsUser()),
      },
    );
  }
}
