import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/chart/linear_gradient_bar_data.dart';
import 'package:flutter_my_portfolio/ui/components/chart/linear_gradient_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///건강관리 결과 체중 차트
class LinearGradientBarThreeChart extends StatelessWidget {
  ///
  const LinearGradientBarThreeChart({
    super.key,
    required this.chartWidth,
    required this.chartHeight,
    required this.startBar,
    required this.endBar,
    required this.objectiveBar,
  });

  ///
  final double chartWidth;

  ///
  final double chartHeight;

  ///
  final LinearGradientBarData startBar;

  ///
  final LinearGradientBarData endBar;

  ///
  final LinearGradientBarData objectiveBar;

  ///최소
  double min() {
    double result = 0;

    List<double> list = [startBar.barValue, endBar.barValue, objectiveBar.barValue];

    ///최소값
    result = list.reduce((double curr, double next) => curr < next ? curr : next);

    return 15 + (135 * result);
  }

  ///최대
  double max() {
    double result = 0;

    List<double> list = [startBar.barValue, endBar.barValue, objectiveBar.barValue];

    ///최대값
    result = list.reduce((double curr, double next) => curr > next ? curr : next);

    return 15 + (140 * result);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: chartWidth,
      height: chartHeight,
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: min().h),
            child: DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 0.5.w,
              dashLength: 5.0,
              dashColor: Colors.blue,
              dashGapLength: 2.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: max().h),
            child: DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 0.5.w,
              dashLength: 5.0,
              dashColor: Colors.red,
              dashGapLength: 2.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LinearGradientBar(
                chartHeight: chartHeight,
                value: startBar.value,
                unitText: startBar.unitText,
                barValue: startBar.barValue,
                averageValue: startBar.averageValue,
                bottomBarValue: startBar.bottomBarValue,
                topBarValue: startBar.topBarValue,
                topBarColor: startBar.topBarColor,
                bottomBarColor: startBar.bottomBarColor,
                dateText: startBar.dateText,
                chartWidth: 60.w,
              ),
              LinearGradientBar(
                chartHeight: chartHeight,
                value: endBar.value,
                unitText: endBar.unitText,
                barValue: endBar.barValue,
                averageValue: endBar.averageValue,
                bottomBarValue: endBar.bottomBarValue,
                topBarValue: endBar.topBarValue,
                topBarColor: endBar.topBarColor,
                bottomBarColor: endBar.bottomBarColor,
                dateText: endBar.dateText,
                chartWidth: 60.w,
              ),
              LinearGradientBar(
                chartHeight: chartHeight,
                value: objectiveBar.value,
                unitText: objectiveBar.unitText,
                barValue: objectiveBar.barValue,
                averageValue: objectiveBar.averageValue,
                bottomBarValue: objectiveBar.bottomBarValue,
                topBarValue: objectiveBar.topBarValue,
                topBarColor: objectiveBar.topBarColor,
                bottomBarColor: objectiveBar.bottomBarColor,
                dateText: objectiveBar.dateText,
                chartWidth: 60.w,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.w),
            child: Divider(height: 0.5.h, thickness: 0.5.h, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
