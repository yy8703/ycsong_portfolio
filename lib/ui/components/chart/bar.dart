import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bar extends StatelessWidget {
  ///
  const Bar({
    super.key,
    required this.chartHeight,
    required this.barAreaWidth,
    required this.valueText,
    required this.barValue,
    required this.barColor,
    this.unitText,
    this.bottomText,
  });

  ///차트 높이
  final double chartHeight;

  ///
  final double barAreaWidth;

  ///
  final String valueText;

  ///bar height %
  final double barValue;

  ///
  final Color barColor;

  ///
  final String? unitText;

  ///
  final String? bottomText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: barAreaWidth.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(valueText, style: TextStyle(fontSize: 12.sp)),
                        if (unitText != null)
                          Padding(
                            padding: EdgeInsets.only(left: 1.w),
                            child: Text(unitText!, style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w300, color: Colors.black45)),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: 14.w,
                    height: ((chartHeight - 40) * barValue).h,
                    decoration: BoxDecoration(
                      color: barColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.w),
                        topRight: Radius.circular(7.w),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (bottomText != null)
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(bottomText!, style: TextStyle(fontSize: 10.sp)),
            ),
        ],
      ),
    );
  }
}
