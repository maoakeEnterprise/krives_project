import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/programme/programme%20series/bloc/create_series_bloc/create_series_bloc.dart';
import 'package:krives_project/features/programme/programme%20series/services/service_series.dart';

class TextFieldCustomDuringSeries extends StatelessWidget {
  final TextEditingController controller;
  final String textDefinitionTextField;

  const TextFieldCustomDuringSeries({
    super.key,
    required this.controller,
    required this.textDefinitionTextField,
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      height: 23,
      margin: EdgeInsets.fromLTRB(30, 8, 20, 12),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ThemesColor.themes[2][themeChoice],
      ),
      child: BlocBuilder<CreateSeriesBloc, CreateSeriesState>(
        builder: (context, state) {
          return TextField(
            onChanged: (value) {
              ServiceSeries.updateTextFieldDataSeries(state, context, textDefinitionTextField, value);
            },
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLength: 6,
            cursorHeight: 14,
            style: ThemesTextStyles.themes[3][themeChoice],
            cursorColor: ThemesColor.themes[7][themeChoice],
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: ThemesColor.themes[2][themeChoice],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide.none,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: true,
            ),
          );
        },
      ),
    );
  }
}
