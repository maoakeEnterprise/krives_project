import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/theme_data.dart';
import 'package:krives_project/features/base/page/base_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const BasePage(),
      theme: appTheme(),
    );
  }
}


