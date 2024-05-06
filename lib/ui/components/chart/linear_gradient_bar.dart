import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///linearGradientbar 차트
class LinearGradientBar extends StatelessWidget {
  ///
  const LinearGradientBar({
    super.key,
    this.isAfter = false,
    this.afterText = '',
    required this.chartHeight,
    required this.value,
    required this.unitText,
    required this.barValue,
    required this.averageValue,
    required this.topBarValue,
    required this.bottomBarValue,
    required this.topBarColor,
    required this.bottomBarColor,
    required this.dateText,
    this.isInnerValueText = false,
    this.chartWidth = 60,
  });

  ///
  final bool isAfter;

  ///
  final String afterText;

  ///fragment의 container height, 비율 계산을 위해 필요, 순수 double만 입력
  final double chartHeight;

  ///
  final double value;

  ///
  final String unitText;

  ///bar height %
  final double barValue;

  ///평균 %
  final double averageValue;

  ///
  final double topBarValue;

  ///
  final double bottomBarValue;

  ///
  final Color topBarColor;

  ///
  final Color bottomBarColor;

  ///
  final String dateText;

  ///
  final double chartWidth;

  ///
  final bool isInnerValueText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: chartWidth,
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
                  if (isAfter)
                    Text(
                      afterText,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.blue,
                        letterSpacing: -0.2,
                      ),
                    ),
                  (isInnerValueText)
                      ? Container()
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: value.toString(),
                                style: TextStyle(fontSize: 10.sp, letterSpacing: -0.5),
                              ),
                              TextSpan(
                                text: ' $unitText',
                                style: TextStyle(
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: 4.h),
                  gradientBar(),
                ],
              ),
              (isInnerValueText && value != 0)
                  ? Positioned(
                      top: 6.5.h,
                      child: Container(
                        child: Text(
                          value.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              if (averageValue != 0)
                Positioned(
                  right: 0,
                  bottom: (((chartHeight - 50) * averageValue) - 5.5).h,
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 4.w),
                      SizedBox(width: 2.w),
                      Text(
                        '평균',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            dateText,
            style: TextStyle(
              fontSize: 9.sp,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }

  ///
  double barHeight() {
    return (chartHeight - 55);
  }

  ///
  Widget gradientBar() {
    if (topBarValue > 0) {
      return Column(
        children: [
          Container(
            width: 14.w,
            height: (barHeight() * topBarValue).h,
            decoration: BoxDecoration(
              color: topBarColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7.w),
                topRight: Radius.circular(7.w),
              ),
            ),
          ),
          Container(
            width: 14.w,
            height: (barHeight() * bottomBarValue).h,
            decoration: BoxDecoration(
              color: bottomBarColor,
            ),
          ),
        ],
      );
    } else {
      return Container(
        width: 14.w,
        height: (barHeight() * bottomBarValue).h,
        decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7.w),
            topRight: Radius.circular(7.w),
          ),
        ),
      );
    }
  }
}
