import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NormalBarData extends Equatable {
  ///
  const NormalBarData({
    required this.valueText,
    required this.barValue,
    required this.barColor,
    required this.bottomText,
    this.unitText,
  });

  ///
  final String valueText;

  ///
  final double barValue;

  ///
  final Color barColor;

  ///
  final String bottomText;

  ///
  final String? unitText;

  NormalBarData format() {
    return NormalBarData(
      valueText: valueText,
      barValue: barValue,
      barColor: barColor,
      bottomText: bottomText,
      unitText: unitText,
    );
  }

  @override
  List<Object?> get props => [
        valueText,
        barValue,
        barColor,
        bottomText,
        unitText,
      ];
}
