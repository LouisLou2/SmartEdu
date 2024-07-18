import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_edu/extension/context_extension.dart';

import '../../style/style_scheme.dart';
import '../../util/format_util.dart';

class CustomLineChart extends StatelessWidget {
  final List<int> data;
  final double aspectRatio;

  const CustomLineChart({super.key, required this.data, this.aspectRatio = 1.75});
  
  @override
  Widget build(BuildContext context) {
    final mtheme = context.theme;
    return AspectRatio(
      aspectRatio: 1.75,
      child: LineChart(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        LineChartData(
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(
                  color: mtheme.colorScheme.primary.withOpacity(0.3),
                  width: 1.sp,
                ),
                left: BorderSide(
                  color: mtheme.colorScheme.primary.withOpacity(0.3),
                  width: 1.sp,
                ),
                right: BorderSide.none,
                top: BorderSide.none,
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                barWidth: 6.sp,
                spots: List.generate(data.length, (index)=>FlSpot(index.toDouble(), data[index].toDouble(),),),
                gradient: const LinearGradient(
                  colors: [Colors.indigoAccent, Colors.blue, Colors.green],
                ),
                isCurved: true,
                isStrokeCapRound: true,
                isStrokeJoinRound: true,
                preventCurveOverShooting: true,
                shadow: Shadow(
                  color: mtheme.colorScheme.primary.withOpacity(0.3),
                  blurRadius: 5,
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (LineBarSpot touchedSpot){
                  return mtheme.colorScheme.primary;
                },
                getTooltipItems: (List<LineBarSpot> touchedSpots){
                  return touchedSpots.map((LineBarSpot touchedSpot){
                    return LineTooltipItem(
                      FormatUtil.doubleToStr(touchedSpot.y),
                      TextStyle(
                        color: mtheme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                        fontSize: 12.sp,
                      ),
                    );
                  }).toList();
                },
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: true,
              horizontalInterval: 0.1,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) => FlLine(
                color: mtheme.colorScheme.primary.withOpacity(0.3),
                strokeWidth: 1.sp,
              ),
              getDrawingVerticalLine: (value) => FlLine(
                color: mtheme.colorScheme.primary.withOpacity(0.3),
                strokeWidth: 1.sp,
              ),
            ),
            titlesData: FlTitlesData(
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 0.1,
                  getTitlesWidget: (value, meta){
                    return Text(
                      FormatUtil.doubleToStr(value),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: StyleScheme.engFontFamily,
                        color: mtheme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value,meta){
                    return Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Text(
                        '${value.toInt()}',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: StyleScheme.engFontFamily,
                          color: mtheme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
        ),
      ),
    );
  }
}