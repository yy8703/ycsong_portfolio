import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccomplishmentRateBar extends StatelessWidget {
  ///
  const AccomplishmentRateBar({
    super.key,
    this.barWidth = 250,
    this.barHeight = 14,
    this.barBackgroundColor = Colors.grey,
    this.barColor = Colors.pink,
    required this.barTitle,
    required this.barValue,
    required this.barStateText,
  });

  ///
  final double barWidth;

  ///
  final double barHeight;

  ///
  final Color barBackgroundColor;

  ///
  final Color barColor;

  ///title
  final String barTitle;

  ///
  final double barValue;

  ///
  final String barStateText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              barTitle,
              style: TextStyle(fontSize: 11.sp),
            ),
            SizedBox(height: 5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: barWidth.w,
                      height: barHeight.h,
                      decoration: BoxDecoration(
                        color: barBackgroundColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    Container(
                      width: (barWidth * barValue).w,
                      height: barHeight.h,
                      decoration: BoxDecoration(
                        color: barColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Center(
                  child: Icon(Icons.circle, size: 4.w),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 12.w),
        Padding(
          padding: EdgeInsets.only(top: 19.h),
          child: Text(
            barStateText,
            style: TextStyle(fontSize: 11.sp),
          ),
        ),
      ],
    );
  }
}
