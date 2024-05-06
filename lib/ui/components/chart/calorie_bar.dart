import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///영양비교 바 1개
class CalorieBar extends StatelessWidget {
  ///
  const CalorieBar({
    super.key,
    required this.barTitle,
    required this.calorieBarWidth,
    required this.morningValue,
    required this.morningBarValue,
    required this.lunchValue,
    required this.lunchBarValue,
    required this.dinnerValue,
    required this.dinnerBarValue,
    required this.snackValue,
    required this.snackBarValue,
    required this.totalCalorieValue,
    this.isOpacity = false,
  });

  ///
  final String barTitle;

  ///전체 크기
  final double calorieBarWidth;

  ///
  final int morningValue;

  ///
  final int lunchValue;

  ///
  final int dinnerValue;

  ///
  final int snackValue;

  ///
  final double morningBarValue;

  ///
  final double lunchBarValue;

  ///
  final double dinnerBarValue;

  ///
  final double snackBarValue;

  ///
  final int totalCalorieValue;

  ///
  final bool isOpacity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 26.w, child: Text(barTitle, style: TextStyle(fontSize: 10.sp))),
        SizedBox(width: 20.w),
        Container(
          width: calorieBarWidth.w,
          height: 20.h,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                width: (calorieBarWidth * morningBarValue).w,
                height: 20.h,
                alignment: Alignment.center,
                color: (isOpacity) ? Colors.red.withOpacity(0.16) : Colors.red,
                child: Text(
                  Global.moneyFormat.format(morningValue),
                  style: TextStyle(fontSize: 10.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: (calorieBarWidth * lunchBarValue).w,
                height: 20.h,
                alignment: Alignment.center,
                color: (isOpacity) ? Colors.blue.withOpacity(0.16) : Colors.blue,
                child: Text(
                  Global.moneyFormat.format(lunchValue),
                  style: TextStyle(fontSize: 10.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: (calorieBarWidth * dinnerBarValue).w,
                height: 20.h,
                alignment: Alignment.center,
                color: (isOpacity) ? Colors.green.withOpacity(0.16) : Colors.green,
                child: Text(
                  Global.moneyFormat.format(dinnerValue),
                  style: TextStyle(fontSize: 10.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: (calorieBarWidth * snackBarValue).w,
                height: 20.h,
                alignment: Alignment.center,
                color: (isOpacity) ? Colors.lime.withOpacity(0.16) : Colors.lime,
                child: Text(
                  Global.moneyFormat.format(snackValue),
                  style: TextStyle(fontSize: 10.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        FittedBox(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(text: Global.moneyFormat.format(totalCalorieValue), style: TextStyle(fontSize: 10.sp)),
            TextSpan(text: ' kcal', style: TextStyle(fontSize: 8.sp, color: Colors.grey, fontWeight: FontWeight.w300)),
          ])),
        ),
      ],
    );
  }
}
