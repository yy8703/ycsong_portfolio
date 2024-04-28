import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/clone/tab_bar_data.dart';

class CloneState extends Equatable {
  const CloneState({
    required this.tapBarDataList,
    required this.seletedTapBarTitle,
  });

  final List<TapBarData> tapBarDataList;

  final String seletedTapBarTitle;

  CloneState copyWith({
    List<TapBarData>? tapBarDataList,
    String? seletedTapBarTitle,
  }) {
    return CloneState(
      tapBarDataList: tapBarDataList ?? this.tapBarDataList,
      seletedTapBarTitle: seletedTapBarTitle ?? this.seletedTapBarTitle,
    );
  }

  @override
  List<Object?> get props => [
        tapBarDataList,
        seletedTapBarTitle,
      ];
}
