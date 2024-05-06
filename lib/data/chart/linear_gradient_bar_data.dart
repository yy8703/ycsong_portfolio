import 'dart:ui';

import 'package:equatable/equatable.dart';

///
class LinearGradientBarData extends Equatable {
  ///
  const LinearGradientBarData({
    required this.value,
    required this.unitText,
    required this.barValue,
    required this.averageValue,
    required this.topBarValue,
    required this.bottomBarValue,
    required this.topBarColor,
    required this.bottomBarColor,
    required this.dateText,
    this.isAfter,
    this.afterMonth,
  });

  ///값
  final double value;

  ///값 단위
  final String unitText;

  ///바 높이 %
  final double barValue;

  ///평균 높이 %
  final double averageValue;

  ///윗 바 %
  final double topBarValue;

  ///아랫바 %
  final double bottomBarValue;

  ///윗 바 색상
  final Color topBarColor;

  ///아랫 바 색상
  final Color bottomBarColor;

  ///날짜 text
  final String dateText;

  ///종료 여부
  final bool? isAfter;

  ///시작 후 개월 수
  final int? afterMonth;

  LinearGradientBarData format() {
    return LinearGradientBarData(
      value: value,
      unitText: unitText,
      barValue: barValue,
      averageValue: averageValue,
      topBarValue: topBarValue,
      bottomBarValue: bottomBarValue,
      topBarColor: topBarColor,
      bottomBarColor: bottomBarColor,
      dateText: dateText,
      isAfter: isAfter,
      afterMonth: afterMonth,
    );
  }

  @override
  List<Object?> get props => [
        value,
        unitText,
        barValue,
        averageValue,
        topBarValue,
        bottomBarValue,
        topBarColor,
        bottomBarColor,
        dateText,
        isAfter,
        afterMonth,
      ];
}
