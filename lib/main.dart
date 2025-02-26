import 'package:flutter/material.dart';
import 'package:krives_project/all_blocs_provider.dart';
import 'package:krives_project/core/services/auth_services.dart';
import 'package:krives_project/root_app.dart';

import 'injection_container.dart';

void main() async {
  await AuthServices.connectionToDatabase();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AllBlocsProvider(
        child: RootApp(),
    );
  }
}


