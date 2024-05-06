import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultAccomplishmentRateBar extends StatelessWidget {
  ///
  const ResultAccomplishmentRateBar({
    super.key,
    this.barWidth = 225,
    this.barHeight = 14,
    this.barBackgroundColor = Colors.grey,
    required this.title,
    required this.value,
    required this.barColor,
  });

  ///
  final double barWidth;

  ///
  final double barHeight;

  ///
  final Color barBackgroundColor;

  ///
  final String title;

  ///
  final double value;

  ///
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300)),
        SizedBox(width: 10.w),
        Container(
          width: barWidth.w,
          height: barHeight.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: barBackgroundColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(7.w), bottomRight: Radius.circular(7.w)),
          ),
          child: Container(
            width: (barWidth * value).w,
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(7.w), bottomRight: Radius.circular(7.w)),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Text('${(value * 100).floor()}%', style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}
