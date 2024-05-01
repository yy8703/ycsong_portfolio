import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/clone/pop_up_data.dart';
import 'package:flutter_my_portfolio/data/clone/tab_bar_data.dart';

class CloneState extends Equatable {
  const CloneState({
    required this.tapBarDataList,
    required this.seletedTapBarTitle,
    required this.popUpDataList,
    required this.popUpViewIndex,
  });

  //탭바 데이터 리스트
  final List<TapBarData> tapBarDataList;

  //선택된 탭바 정보
  final String seletedTapBarTitle;

  //팝업 데이터 리스트
  final List<PopUpData> popUpDataList;

  final int popUpViewIndex;

  CloneState copyWith({
    List<TapBarData>? tapBarDataList,
    String? seletedTapBarTitle,
    List<PopUpData>? popUpDataList,
    int? popUpViewIndex,
  }) {
    return CloneState(
      tapBarDataList: tapBarDataList ?? this.tapBarDataList,
      seletedTapBarTitle: seletedTapBarTitle ?? this.seletedTapBarTitle,
      popUpDataList: popUpDataList ?? this.popUpDataList,
      popUpViewIndex: popUpViewIndex ?? this.popUpViewIndex,
    );
  }

  @override
  List<Object?> get props => [
        tapBarDataList,
        seletedTapBarTitle,
        popUpDataList,
        popUpViewIndex,
      ];
}
