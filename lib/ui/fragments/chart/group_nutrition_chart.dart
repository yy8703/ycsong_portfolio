import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/chart/calorie_bar_data.dart';
import 'package:flutter_my_portfolio/ui/components/chart/calorie_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupNutritionChart extends StatelessWidget {
  ///
  const GroupNutritionChart({
    super.key,
    required this.chartWidth,
    required this.childCalorieBarData,
    required this.groupCalorieBarData,
  });

  ///
  final double chartWidth;

  ///
  final CalorieBarData childCalorieBarData;

  ///
  final CalorieBarData groupCalorieBarData;

  ///
  double childCalorieBarWidth() {
    double result = 0;

    if (childCalorieBarData.totalCalorieValue > groupCalorieBarData.totalCalorieValue) {
      result = (chartWidth - 100);
    } else {
      result = (chartWidth - 100) * (childCalorieBarData.totalCalorieValue / groupCalorieBarData.totalCalorieValue);
    }

    return result;
  }

  ///
  double groupCalorieBarWidth() {
    double result = 0;

    if (childCalorieBarData.totalCalorieValue > groupCalorieBarData.totalCalorieValue) {
      result = (chartWidth - 100) * (groupCalorieBarData.totalCalorieValue / childCalorieBarData.totalCalorieValue);
    } else {
      result = (chartWidth - 100);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: chartWidth.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalorieBar(
            barTitle: childCalorieBarData.barTitle,
            calorieBarWidth: childCalorieBarWidth(),
            morningValue: childCalorieBarData.morningValue,
            lunchValue: childCalorieBarData.lunchValue,
            dinnerValue: childCalorieBarData.dinnerValue,
            snackValue: childCalorieBarData.snackValue,
            morningBarValue: childCalorieBarData.morningBarValue,
            lunchBarValue: childCalorieBarData.lunchBarValue,
            dinnerBarValue: childCalorieBarData.dinnerBarValue,
            snackBarValue: childCalorieBarData.snackBarValue,
            totalCalorieValue: childCalorieBarData.totalCalorieValue,
          ),
          Padding(
            padding: EdgeInsets.only(left: 46.5.w),
            child: SizedBox(
              width: (chartWidth - 100).w,
              height: 50.h,
              child: CustomPaint(
                painter: LinePainter(
                  childCalorieBarWidth: childCalorieBarWidth(),
                  groupCalorieBarWidth: groupCalorieBarWidth(),
                  childCalorieBarData: childCalorieBarData,
                  groupCalorieBarData: groupCalorieBarData,
                ),
              ),
            ),
          ),
          CalorieBar(
            barTitle: groupCalorieBarData.barTitle,
            calorieBarWidth: groupCalorieBarWidth(),
            morningValue: groupCalorieBarData.morningValue,
            lunchValue: groupCalorieBarData.lunchValue,
            dinnerValue: groupCalorieBarData.dinnerValue,
            snackValue: groupCalorieBarData.snackValue,
            morningBarValue: groupCalorieBarData.morningBarValue,
            lunchBarValue: groupCalorieBarData.lunchBarValue,
            dinnerBarValue: groupCalorieBarData.dinnerBarValue,
            snackBarValue: groupCalorieBarData.snackBarValue,
            totalCalorieValue: groupCalorieBarData.totalCalorieValue,
            isOpacity: true,
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  ///
  const LinePainter({
    required this.childCalorieBarWidth,
    required this.groupCalorieBarWidth,
    required this.childCalorieBarData,
    required this.groupCalorieBarData,
    this.color = Colors.blue,
    this.strokeWidth = 0.5,
    this.dashLength = 3.0,
    this.dashSpace = 2.0,
  });

  ///
  final double childCalorieBarWidth;

  ///
  final double groupCalorieBarWidth;

  ///
  final CalorieBarData childCalorieBarData;

  ///
  final CalorieBarData groupCalorieBarData;

  ///
  final Color color;

  ///
  final double strokeWidth;

  ///
  final double dashLength;

  ///
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    double x1 = 0;
    double y1 = 0; //고정
    double x2 = 0;
    double y2 = 49.h; //고정

    ///
    double childBarTotalWidth = 0;
    double groupBarTotalWidth = 0;

    if (childCalorieBarData.morningBarValue > 0 && groupCalorieBarData.morningBarValue > 0) {
      _drawDashedLine(dashLength, dashSpace, Offset(x1.w, y1), Offset(x2.w, y2), canvas, size, paint);

      x1 = (((childCalorieBarWidth * childCalorieBarData.morningBarValue) + childBarTotalWidth) - 0.5);
      x2 = (((groupCalorieBarWidth * groupCalorieBarData.morningBarValue) + groupBarTotalWidth) - 0.5);

      _drawDashedLine(dashLength, dashSpace, Offset(x1.w, y1), Offset(x2.w, y2), canvas, size, paint);

      childBarTotalWidth += (childCalorieBarWidth * childCalorieBarData.morningBarValue);
      groupBarTotalWidth += (groupCalorieBarWidth * groupCalorieBarData.morningBarValue);
    } else if (childCalorieBarData.morningBarValue > 0) {
      childBarTotalWidth += (childCalorieBarWidth * childCalorieBarData.morningBarValue);
    } else if (groupCalorieBarData.morningBarValue > 0) {
      groupBarTotalWidth += (groupCalorieBarWidth * groupCalorieBarData.morningBarValue);
    }

    if (childCalorieBarData.lunchBarValue > 0 && groupCalorieBarData.lunchBarValue > 0) {
      x1 = (childBarTotalWidth - 0.5);
      x2 = (groupBarTotalWidth - 0.5);

      _drawDashedLine(dashLength, dashSpace, Offset(x1.w, y1), Offset(x2.w, y2), canvas, size, paint);

      x1 = (((childCalorieBarWidth * childCalorieBarData.lunchBarValue) + childBarTotalWidth) - 0.5);
      x2 = (((groupCalorieBarWidth * groupCalorieBarData.lunchBarValue) + groupBarTotalWidth) - 0.5);

      _drawDashedLine(dashLength, dashSpace, Offset(x1.w, y1), Offset(x2.w, y2), canvas, size, paint);

      childBarTotalWidth += (childCalorieBarWidth * childCalorieBarData.lunchBarValue);
      groupBarTotalWidth += (groupCalorieBarWidth * groupCalorieBarData.lunchBarValue);
    } else if (childCalorieBarData.lunchBarValue > 0) {
      childBarTotalWidth += (childCalorieBarWidth * childCalorieBarData.lunchBarValue);
    } else if (groupCalorieBarData.lunchBarValue > 0) {
      groupBarTotalWidth += (groupCalorieBarWidth * groupCalorieBarData.lunchBarValue);
    }

    if (childCalorieBarData.dinnerBarValue > 0 && groupCalorieBarData.dinnerBarValue > 0) {
      x1 = (childBarTotalWidth - 0.5);
      x2 = (groupBarTotalWidth - 0.5);

      _drawDashedLine(dashLength, dashSpace, Offset(x1.w, y1), Offset(x2.w, y2), canvas, size, paint);

      x1 = (((childCalorieBarWidth * childCalorieBarData.dinnerBarValue) + childBarTotalWidth) - 0.5);
      x2 = (((groupCalorieBarWidth * groupCalorieBarData.dinnerBarValue) + groupBarTotalWidth) - 0.5);

      _drawDashedLine(dashLength, dashSpace, Offset(x1.w, y1), Offset(x2.w, y2), canvas, size, paint);

      childBarTotalWidth += (childCalorieBarWidth * childCalorieBarData.dinnerBarValue);
      groupBarTotalWidth += (groupCalorieBarWidth * groupCalorieBarData.dinnerBarValue);
    } else if (childCalorieBarData.dinnerBarValue > 0) {
      childBarTotalWidth += (childCalorieBarWidth * childCalorieBarData.dinnerBarValue);
    } else if (groupCalorieBarData.dinnerBarValue > 0) {
      groupBarTotalWidth += (groupCalorieBarWidth * groupCalorieBarData.dinnerBarValue);
    }

    if (childCalorieBarData.snackBarValue > 0 && groupCalorieBarData.snackBarValue > 0) {
      x1 = (childBarTotalWidth - 0.5);
      x2 = (groupBarTotalWidth - 0.5);

      _drawDashedLine(dashLength, dashSpace, Offset(x1.w, y1), Offset(x2.w, y2), canvas, size, paint);

      x1 = (((childCalorieBarWidth * childCalorieBarData.snackBarValue) + childBarTotalWidth) - 0.5);
      x2 = (((groupCalorieBarWidth * groupCalorieBarData.snackBarValue) + groupBarTotalWidth) - 0.5);

      _drawDashedLine(dashLength, dashSpace, Offset(x1.w, y1), Offset(x2.w, y2), canvas, size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawDashedLine(double dashLength, double dashSpace, Offset firstOffset, Offset secondOffset, Canvas canvas, Size size, Paint paint) {
    Offset startOffset = firstOffset;

    double intervals = _getDirectionVector(firstOffset, secondOffset).length / (dashLength + dashSpace);

    for (int i = 0; i < intervals; i++) {
      Offset endOffset = _getNextOffset(startOffset, secondOffset, dashLength);

      /// Draw a small line.
      canvas.drawLine(startOffset, endOffset, paint);

      /// Update the starting offset.
      startOffset = _getNextOffset(endOffset, secondOffset, dashSpace);
    }
  }

  Offset _getNextOffset(
    Offset firstOffset,
    Offset secondOffset,
    double smallVectorLength,
  ) {
    DirectionVector directionVector = _getDirectionVector(firstOffset, secondOffset);

    double rescaleFactor = smallVectorLength / directionVector.length;
    if (rescaleFactor.isNaN || rescaleFactor.isInfinite) {
      rescaleFactor = 1;
    }

    Offset rescaledVector = Offset(directionVector.vector.dx * rescaleFactor, directionVector.vector.dy * rescaleFactor);

    Offset newOffset = Offset(firstOffset.dx + rescaledVector.dx, firstOffset.dy + rescaledVector.dy);

    return newOffset;
  }

  DirectionVector _getDirectionVector(Offset firstVector, Offset secondVector) {
    Offset directionVector = Offset(secondVector.dx - firstVector.dx, secondVector.dy - firstVector.dy);

    double directionVectorLength = sqrt(pow(directionVector.dx, 2) + pow(directionVector.dy, 2));

    return DirectionVector(
      vector: directionVector,
      length: directionVectorLength,
    );
  }
}

class DirectionVector {
  final Offset vector;
  final double length;

  ///
  const DirectionVector({
    required this.vector,
    required this.length,
  });
}
