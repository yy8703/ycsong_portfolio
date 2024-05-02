import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/clone/item_data.dart';
import 'package:flutter_my_portfolio/data/clone/pop_up_data.dart';
import 'package:flutter_my_portfolio/data/clone/tab_bar_data.dart';
import 'package:flutter_my_portfolio/data/types.dart';

class CloneState extends Equatable {
  const CloneState({
    required this.tapTitle,
    required this.tapBarDataList,
    required this.popUpDataList,
    required this.popUpViewIndex,
    required this.itemDataList,
  });

  final TapTitle tapTitle;

  //탭바 데이터 리스트
  final List<TapBarData> tapBarDataList;

  //팝업 데이터 리스트
  final List<PopUpData> popUpDataList;

  final int popUpViewIndex;

  //상품 목록
  final List<ItemData> itemDataList;

  CloneState copyWith({
    TapTitle? tapTitle,
    List<TapBarData>? tapBarDataList,
    List<PopUpData>? popUpDataList,
    int? popUpViewIndex,
    List<ItemData>? itemDataList,
  }) {
    return CloneState(
      tapTitle: tapTitle ?? this.tapTitle,
      tapBarDataList: tapBarDataList ?? this.tapBarDataList,
      popUpDataList: popUpDataList ?? this.popUpDataList,
      popUpViewIndex: popUpViewIndex ?? this.popUpViewIndex,
      itemDataList: itemDataList ?? this.itemDataList,
    );
  }

  @override
  List<Object?> get props => [
        tapTitle,
        tapBarDataList,
        popUpDataList,
        popUpViewIndex,
        itemDataList,
      ];
}
