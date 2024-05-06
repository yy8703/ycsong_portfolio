import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/chart/accomplishment_rate_bar_data.dart';
import 'package:flutter_my_portfolio/ui/components/chart/accomplishment_rate_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccomplishmentRateChart extends StatelessWidget {
  ///
  const AccomplishmentRateChart({
    super.key,
    required this.chartWidth,
    required this.chartHeight,
    required this.exerciseAccomplishmentRateBar,
    required this.sleepAccomplishmentRateBar,
    required this.nutritionAccomplishmentRateBar,
  });

  ///
  final double chartWidth;

  ///
  final double chartHeight;

  ///운동
  final AccomplishmentRateBarData exerciseAccomplishmentRateBar;

  ///수면
  final AccomplishmentRateBarData sleepAccomplishmentRateBar;

  ///영양
  final AccomplishmentRateBarData nutritionAccomplishmentRateBar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: chartWidth.w,
      height: chartHeight.h,
      child: Column(
        children: [
          AccomplishmentRateBar(
            barWidth: chartWidth - 50,
            barTitle: exerciseAccomplishmentRateBar.barTitle,
            barValue: exerciseAccomplishmentRateBar.barValue,
            barStateText: exerciseAccomplishmentRateBar.barStateText,
          ),
          SizedBox(height: 35.h),
          AccomplishmentRateBar(
            barWidth: chartWidth - 50,
            barTitle: sleepAccomplishmentRateBar.barTitle,
            barValue: sleepAccomplishmentRateBar.barValue,
            barStateText: sleepAccomplishmentRateBar.barStateText,
          ),
          SizedBox(height: 35.h),
          AccomplishmentRateBar(
            barWidth: chartWidth - 50,
            barTitle: nutritionAccomplishmentRateBar.barTitle,
            barValue: nutritionAccomplishmentRateBar.barValue,
            barStateText: nutritionAccomplishmentRateBar.barStateText,
          ),
        ],
      ),
    );
  }
}
