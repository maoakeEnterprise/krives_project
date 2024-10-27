import 'package:flutter/material.dart';
import 'package:krives_project/features/connexion/page/connexion.dart';
import 'package:krives_project/features/home/pages/homepage.dart';
import 'package:krives_project/features/signup/page/signup.dart';
import 'package:krives_project/testwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const TestWidget(),
    );
  }
}


