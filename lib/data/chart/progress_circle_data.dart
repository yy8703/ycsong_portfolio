import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProgressCircleData extends Equatable {
  ///
  const ProgressCircleData({
    required this.order,
    required this.progressColor,
    required this.progressStartHour,
    required this.progressStartMinute,
    required this.progressTimeHour,
    required this.progressTimeMinute,
  });

  ///
  final int order;

  ///
  final Color progressColor;

  ///
  final int progressStartHour;

  ///
  final int progressStartMinute;

  ///
  final int progressTimeHour;

  ///
  final int progressTimeMinute;

  ///
  ProgressCircleData format() {
    return ProgressCircleData(
      order: order,
      progressColor: progressColor,
      progressStartHour: progressStartHour,
      progressStartMinute: progressStartMinute,
      progressTimeHour: progressTimeHour,
      progressTimeMinute: progressTimeMinute,
    );
  }

  @override
  List<Object?> get props => [
        order,
        progressColor,
        progressStartHour,
        progressStartMinute,
        progressTimeHour,
        progressTimeMinute,
      ];
}
