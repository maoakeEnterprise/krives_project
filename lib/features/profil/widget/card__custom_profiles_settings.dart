import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';

class CardCustomProfileSettings extends StatelessWidget {
  final Widget? child;
  const CardCustomProfileSettings({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 14, 0, 14),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
        color: ThemesColor.themes[0][themeChoice],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(
          offset: Offset(0, 2),
          color: Colors.black.withValues(alpha: 0.3),
          blurRadius: 5,
        )]
      ),
      child: child,
    );
  }
}
