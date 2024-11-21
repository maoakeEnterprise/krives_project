import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/themes_color.dart';
import 'package:krives_project/core/data/datasrouces/themes_text_styles.dart';

class ButtonWidgetTimer extends StatelessWidget {
  final VoidCallback onPressed; // Callback when button is tapped
  final String label;

  const ButtonWidgetTimer({
    super.key,
    required this.onPressed,
    this.label = 'Add 30 Seconds',
  });

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return GestureDetector(
      onTap: onPressed, // Trigger the callback when tapped
      child: Container(
        width: 68,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ThemesColor.themes[0][themeChoice],
        ),
        child: Center(
          child: Text(
            label,
            style: ThemesTextStyles.themes[8][themeChoice],
          ),
        ),
      ),
    );
  }
}
