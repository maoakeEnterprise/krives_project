import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_graphic.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({super.key});

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: ThemesColor.themesGradient[2][themeChoice],
        ),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              axisNameSize: 20,
              axisNameWidget: Text("")
            ),
            topTitles: AxisTitles(
              axisNameSize: 20,
              axisNameWidget: Text(""),
            ),
            bottomTitles: AxisTitles(///Axis X
              sideTitles: SideTitles(
                  interval: 1,
                  reservedSize:50,
                  showTitles: true,
                  getTitlesWidget: (test, value) {
                    return Container(margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(value.formattedValue, style: ThemesTextStyles.themes[5][themeChoice]));
                  }
              )
            ),
            leftTitles: AxisTitles(///Axis Y
                sideTitles: SideTitles(
                    reservedSize: 50,
                    showTitles: true,
                    getTitlesWidget: (_, value) {
                      return Container(margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(value.formattedValue, style: ThemesTextStyles.themes[5][themeChoice]));
                    }
                )
            ),

          ),
          gridData: ThemesGraphic.gridData,
          borderData: FlBorderData(show: false),
          minY: 0,
          maxY: 6,
          minX: 0,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(1, 1),
                FlSpot(2, 4),
                FlSpot(3, 2),
              ],
              dotData: FlDotData(show: false),
              isCurved: true,
              color: ThemesColor.green1,
              barWidth: 1,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(colors: [
                  ThemesColor.green1.withValues(alpha: 0.2),
                  ThemesColor.green1.withValues(alpha: 0.01)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.01, 0.8],
                ),
              )
            )
          ]
        )
      ),
    );
  }
}
