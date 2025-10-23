import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ThemesGraphic{
  static FlGridData gridData = FlGridData(
    show: true,
    drawHorizontalLine: true,
    getDrawingHorizontalLine: (value) {
      return FlLine(
        color: Colors.grey.withValues(alpha: 0.2),
        strokeWidth: 1,
      );
    },
    drawVerticalLine: true,
    getDrawingVerticalLine: (value) {
      return FlLine(
        color: Colors.grey.withValues(alpha: 0.2),
        strokeWidth: 1,

      );
    }
  );
}