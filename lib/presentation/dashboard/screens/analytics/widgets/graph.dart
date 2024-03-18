import 'package:flutter/material.dart';
import '/core/app_export.dart';

class LineGraph extends StatelessWidget {
  LineGraph({
    super.key,
    Color? line1Color,
    Color? line2Color,
    Color? betweenColor,
    required this.data,
    required this.numberOfYears,
  })  : line1Color = line1Color ?? AppColors.contentColorGreen,
        line2Color = line2Color ?? AppColors.contentColorRed,
        betweenColor =
            betweenColor ?? AppColors.contentColorRed.withOpacity(0.5);

  final Color line1Color;
  final Color line2Color;
  final Color betweenColor;
  final YearOverYear data;
  final num numberOfYears;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'Jan';
        break;
      case 2:
        text = 'Feb';
        break;
      case 3:
        text = 'Mar';
        break;
      case 4:
        text = 'Apr';
        break;
      case 5:
        text = 'May';
        break;
      case 6:
        text = 'Jun';
        break;
      case 7:
        text = 'Jul';
        break;
      case 8:
        text = 'Aug';
        break;
      case 9:
        text = 'Sep';
        break;
      case 10:
        text = 'Oct';
        break;
      case 11:
        text = 'Nov';
        break;
      case 12:
        text = 'Dec';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.v,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 8.fSize,
          fontWeight: FontWeight.bold,
          color: appTheme.primary,
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        '${data.currencySymbol}${value.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 8.fSize,
          fontWeight: FontWeight.bold,
          color: appTheme.primary,
        ),
      ),
    );
  }

  double maxY(num? max, num? min) {
    if (max == null) {
      return 1.0;
    } else {
      return (max + intervalY(max, min)).floorToDouble();
    }
  }

  double minY(num? min) {
    if (min == null) {
      return 1.0;
    } else {
      return (min).floorToDouble();
    }
  }

  double intervalY(num? max, num? min) {
    if (max == null || min == null) {
      return 1.0;
    } else {
      console.log({'max': max, 'min': min, 'interval': (max / min).round()});

      return (max / 4).roundToDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    intervalY(data.maxValue, data.minValue);
    return AspectRatio(
      aspectRatio: 2.0,
      child: LineChart(
        LineChartData(
          minY: minY(data.minValue),
          maxY: maxY(data.maxValue, data.minValue),
          lineTouchData: LineTouchData(
            handleBuiltInTouches: true,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
              tooltipRoundedRadius: 8,
              fitInsideHorizontally: true,
              fitInsideVertically: true,
              showOnTopOfTheChartBoxArea: true,
              getTooltipItems: (List<LineBarSpot> touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  final FlSpot spot = touchedSpot;
                  return LineTooltipItem(
                    '${spot.y}',
                    const TextStyle(color: Colors.white),
                  );
                }).toList();
              },
            ),
          ),
          lineBarsData: data.chartData!.map((chart) {
            return LineChartBarData(
              color: chart.color,
              spots: chart.spots!.map((spots) {
                return FlSpot(spots.x, spots.y);
              }).toList(),
              isCurved: true,
              barWidth: 1,
              dotData: FlDotData(
                show: true,
                getDotPainter: (FlSpot spot, double xPercentage,
                    LineChartBarData bar, int index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: chart.color!,
                  );
                },
              ),
            );
          }).toList(),
          borderData: FlBorderData(
            show: false,
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: leftTitleWidgets,
                interval: intervalY(data.maxValue, data.minValue),
                reservedSize: 70.h,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: const FlGridData(
            show: false,
          ),
        ),
      ),
    );
  }
}
