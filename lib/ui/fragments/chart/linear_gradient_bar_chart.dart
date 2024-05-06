import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/chart/linear_gradient_bar_data.dart';
import 'package:flutter_my_portfolio/ui/components/chart/linear_gradient_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///bar 차트
class LinearGradientBarChart extends StatelessWidget {
  ///
  const LinearGradientBarChart({
    super.key,
    required this.chartWidth,
    required this.chartHeight,
    required this.startBar,
    required this.objectiveBar,
  });

  ///
  final double chartWidth;

  ///
  final double chartHeight;

  ///시작
  final LinearGradientBarData startBar;

  ///목표
  final LinearGradientBarData objectiveBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: chartWidth.w,
      height: chartHeight.h,
      // color: Color.fromRGBO(0, 0, 0, 0.4),
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Row(
            children: [
              LinearGradientBar(
                chartHeight: chartHeight,
                value: startBar.value,
                unitText: startBar.unitText,
                barValue: startBar.barValue,
                averageValue: startBar.averageValue,
                bottomBarValue: startBar.bottomBarValue,
                topBarValue: startBar.topBarValue,
                topBarColor: startBar.topBarColor, //Color.fromRGBO(242, 242, 242, 1),
                bottomBarColor: startBar.bottomBarColor, //Color.fromRGBO(242, 242, 242, 0.7),
                dateText: startBar.dateText,
                chartWidth: 60.w,
              ),
              LinearGradientBar(
                isAfter: true,
                chartHeight: chartHeight,
                value: objectiveBar.value, // '0',
                unitText: objectiveBar.unitText, // 'kg/㎡',
                barValue: objectiveBar.barValue, // 0.5,
                averageValue: objectiveBar.averageValue, // 0.5,
                bottomBarValue: objectiveBar.bottomBarValue, // 0.5,
                topBarValue: objectiveBar.topBarValue, // 0.5,
                topBarColor: objectiveBar.topBarColor, // Color.fromRGBO(255, 95, 87, 1),
                bottomBarColor: objectiveBar.bottomBarColor, // Color.fromRGBO(255, 95, 87, 0.7),
                dateText: objectiveBar.dateText, // '09/01',
                chartWidth: 60.w,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.w),
            child: Divider(height: 0.5.h, thickness: 0.5.h, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
