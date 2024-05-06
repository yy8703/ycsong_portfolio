import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/chart/accomplishment_rate_bar_data.dart';
import 'package:flutter_my_portfolio/data/chart/result_accomplishment_rate_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
class ResultAccomplishmentRateChart extends StatelessWidget {
  ///
  const ResultAccomplishmentRateChart({
    super.key,
    required this.chartWidth,
    required this.totalAccomplishmentRateBar,
    required this.exerciseAccomplishmentRateBar,
    required this.sleepAccomplishmentRateBar,
    required this.nutritionAccomplishmentRateBar,
  });

  ///
  final double chartWidth;

  ///
  final AccomplishmentRateBarData totalAccomplishmentRateBar;

  ///
  final AccomplishmentRateBarData exerciseAccomplishmentRateBar;

  ///
  final AccomplishmentRateBarData sleepAccomplishmentRateBar;

  ///
  final AccomplishmentRateBarData nutritionAccomplishmentRateBar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: Column(
        children: [
          ResultAccomplishmentRateBar(
            title: totalAccomplishmentRateBar.barTitle,
            value: totalAccomplishmentRateBar.barValue,
            barColor: Colors.pink.shade300,
          ),
          SizedBox(height: 11.h),
          ResultAccomplishmentRateBar(
            title: exerciseAccomplishmentRateBar.barTitle,
            value: exerciseAccomplishmentRateBar.barValue,
            barColor: Colors.green.shade200,
          ),
          SizedBox(height: 11.h),
          ResultAccomplishmentRateBar(
            title: sleepAccomplishmentRateBar.barTitle,
            value: sleepAccomplishmentRateBar.barValue,
            barColor: Colors.blue.shade200,
          ),
          SizedBox(height: 11.h),
          ResultAccomplishmentRateBar(
            title: nutritionAccomplishmentRateBar.barTitle,
            value: nutritionAccomplishmentRateBar.barValue,
            barColor: Colors.red.shade200,
          ),
        ],
      ),
    );
  }
}
