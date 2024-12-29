import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/programme/create%20programme/bloc/edit_bloc.dart';

class EditButtonProgram extends StatelessWidget {
  const EditButtonProgram({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    IconData icon;
    return BlocBuilder<EditBloc, EditState>(
      builder: (context, state) {
        icon = state is EditIconNormal ? Icons.mode_edit : Icons.arrow_back_ios_new;
        return Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,5),
          child: GestureDetector(
            onTap: (){context.read<EditBloc>().add(EditEventPressed());},
            child: Icon(icon,
              size: 30,
              color: ThemesColor.themes[7][themeChoice],),
          ),
        );
      },
    );
  }
}
