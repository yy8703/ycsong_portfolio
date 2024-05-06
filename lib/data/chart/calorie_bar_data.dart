import 'package:equatable/equatable.dart';

///
class CalorieBarData extends Equatable {
  ///
  const CalorieBarData({
    required this.barTitle,
    required this.morningValue,
    required this.lunchValue,
    required this.dinnerValue,
    required this.snackValue,
    required this.morningBarValue,
    required this.lunchBarValue,
    required this.dinnerBarValue,
    required this.snackBarValue,
    required this.totalCalorieValue,
  });

  ///
  final String barTitle;

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
  CalorieBarData format() {
    return CalorieBarData(
      barTitle: barTitle,
      morningValue: morningValue,
      lunchValue: lunchValue,
      dinnerValue: dinnerValue,
      snackValue: snackValue,
      morningBarValue: morningBarValue,
      lunchBarValue: lunchBarValue,
      dinnerBarValue: dinnerBarValue,
      snackBarValue: snackBarValue,
      totalCalorieValue: totalCalorieValue,
    );
  }

  @override
  List<Object?> get props => [
        barTitle,
        morningValue,
        lunchValue,
        dinnerValue,
        snackValue,
        morningBarValue,
        lunchBarValue,
        dinnerBarValue,
        snackBarValue,
        totalCalorieValue,
      ];
}
