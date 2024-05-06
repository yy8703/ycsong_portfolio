import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/chart/normal_bar_data.dart';
import 'package:flutter_my_portfolio/ui/components/chart/bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
class BarThreeChart extends StatelessWidget {
  ///
  const BarThreeChart({
    super.key,
    required this.chartWidth,
    required this.chartHeight,
    required this.childCalorieBar,
    required this.groupCalorieBar,
    required this.childExerciseTimeBar,
    required this.groupExerciseTimeBar,
    required this.childStepBar,
    required this.groupStepBar,
  });

  ///
  final double chartWidth;

  ///
  final double chartHeight;

  ///자녀 소모칼로리
  final NormalBarData childCalorieBar;

  ///그룹군 소모칼로리
  final NormalBarData groupCalorieBar;

  ///자녀 운동시간
  final NormalBarData childExerciseTimeBar;

  ///그룹군 운동시간
  final NormalBarData groupExerciseTimeBar;

  ///자녀 걸음수
  final NormalBarData childStepBar;

  ///그룹군 걸음수
  final NormalBarData groupStepBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: chartWidth.w,
      height: chartHeight.h,
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Bar(
                        chartHeight: chartHeight,
                        barAreaWidth: 30,
                        valueText: childCalorieBar.valueText,
                        barValue: childCalorieBar.barValue,
                        barColor: childCalorieBar.barColor, //Color.fromRGBO(35, 122, 238, 1),
                      ),
                      Bar(
                        chartHeight: chartHeight,
                        barAreaWidth: 30,
                        valueText: groupCalorieBar.valueText,
                        barValue: groupCalorieBar.barValue,
                        barColor: groupCalorieBar.barColor, //Color.fromRGBO(100, 161, 243, 0.7),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(childCalorieBar.bottomText, style: TextStyle(fontSize: 10.sp)),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Bar(
                        chartHeight: chartHeight,
                        barAreaWidth: 30,
                        valueText: childExerciseTimeBar.valueText, // '100',
                        barValue: childExerciseTimeBar.barValue, // 0.5,
                        barColor: childExerciseTimeBar.barColor, // Color.fromRGBO(35, 122, 238, 1),
                      ),
                      Bar(
                        chartHeight: chartHeight,
                        barAreaWidth: 30,
                        valueText: groupExerciseTimeBar.valueText, // '100',
                        barValue: groupExerciseTimeBar.barValue, // 0.5,
                        barColor: groupExerciseTimeBar.barColor, // Color.fromRGBO(100, 161, 243, 0.7),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(childExerciseTimeBar.bottomText, style: TextStyle(fontSize: 10.sp)),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Bar(
                        chartHeight: chartHeight,
                        barAreaWidth: 30,
                        valueText: childStepBar.valueText, // '100',
                        barValue: childStepBar.barValue, // 0.5,
                        barColor: childStepBar.barColor, // Color.fromRGBO(35, 122, 238, 1),
                      ),
                      Bar(
                        chartHeight: chartHeight,
                        barAreaWidth: 30,
                        valueText: groupStepBar.valueText, // '100',
                        barValue: groupStepBar.barValue, // 0.5,
                        barColor: groupStepBar.barColor, // Color.fromRGBO(100, 161, 243, 0.7),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(childStepBar.bottomText, style: TextStyle(fontSize: 10.sp)),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.w),
            child: Divider(height: 0.5.h, thickness: 0.5.h, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
