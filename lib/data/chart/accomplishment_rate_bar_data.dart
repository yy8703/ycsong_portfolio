import 'package:equatable/equatable.dart';

enum AccomplishmentRateBarState {
  ///부족
  LACK,

  ///보통
  NORMAL,

  ///좋아요
  GOOD,
}

class AccomplishmentRateBarData extends Equatable {
  ///
  const AccomplishmentRateBarData({
    required this.barTitle,
    required this.barValue,
    required this.barStateText,
  });

  ///
  final String barTitle;

  ///
  final double barValue;

  ///
  final String barStateText;

  ///
  AccomplishmentRateBarData format() {
    return AccomplishmentRateBarData(
      barTitle: barTitle,
      barValue: barValue,
      barStateText: barStateText,
    );
  }

  @override
  List<Object?> get props => [
        barTitle,
        barValue,
        barStateText,
      ];
}
