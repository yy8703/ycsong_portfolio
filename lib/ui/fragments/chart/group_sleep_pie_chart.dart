import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/chart/progress_circle_data.dart';
import 'package:flutter_my_portfolio/ui/components/chart/progress_circle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupSleepPieChart extends StatelessWidget {
  ///
  const GroupSleepPieChart({
    Key? key,
    required this.chartWidth,
    required this.circleRadius,
    required this.childSleepPieChart,
    required this.groupSleepPieChart,
  }) : super(key: key);

  ///
  final double chartWidth;

  ///
  final double circleRadius;

  ///
  final ProgressCircleData childSleepPieChart;

  ///
  final ProgressCircleData groupSleepPieChart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: chartWidth.w,
      alignment: Alignment.center,
      child: Row(
        children: [
          ProgressCircle(
            radius: circleRadius.w,
            backCircleColor: Colors.grey,
            progressColor: childSleepPieChart.progressColor,
            progressStartHour: childSleepPieChart.progressStartHour,
            progressStartMinute: childSleepPieChart.progressStartMinute,
            progressTimeHour: childSleepPieChart.progressTimeHour,
            progressTimeMinute: childSleepPieChart.progressTimeMinute,
          ),
          SizedBox(width: 50.w),
          ProgressCircle(
            radius: circleRadius.w,
            backCircleColor: Colors.grey,
            progressColor: groupSleepPieChart.progressColor,
            progressStartHour: groupSleepPieChart.progressStartHour,
            progressStartMinute: groupSleepPieChart.progressStartMinute,
            progressTimeHour: groupSleepPieChart.progressTimeHour,
            progressTimeMinute: groupSleepPieChart.progressTimeMinute,
          ),
        ],
      ),
    );
  }
}
