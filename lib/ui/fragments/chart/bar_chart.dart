import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/chart/normal_bar_data.dart';
import 'package:flutter_my_portfolio/ui/components/chart/bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
class BarChart extends StatelessWidget {
  ///
  const BarChart({
    super.key,
    required this.chartWidth,
    required this.chartHeight,
    required this.meBar,
    required this.sameBar,
  });

  ///
  final double chartWidth;

  ///
  final double chartHeight;

  ///자신
  final NormalBarData meBar;

  ///비교군
  final NormalBarData sameBar;

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
            children: [
              Bar(
                chartHeight: chartHeight,
                barAreaWidth: 50,
                valueText: meBar.valueText,
                unitText: meBar.unitText,
                barValue: meBar.barValue,
                barColor: meBar.barColor, //Color.fromRGBO(35, 122, 238, 1),
                bottomText: meBar.bottomText,
              ),
              SizedBox(width: 30.w),
              Bar(
                chartHeight: chartHeight,
                barAreaWidth: 50,
                valueText: sameBar.valueText,
                unitText: sameBar.unitText,
                barValue: sameBar.barValue,
                barColor: sameBar.barColor, //Color.fromRGBO(100, 161, 243, 0.7),
                bottomText: sameBar.bottomText,
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
