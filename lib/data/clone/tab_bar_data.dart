import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/types.dart';

class TapBarData extends Equatable {
  const TapBarData({
    required this.order,
    required this.title,
    required this.tapTitle,
  });

  final int order;

  //타이틀
  final String title;

  final TapTitle tapTitle;

  @override
  List<Object> get props => [
        order,
        title,
        tapTitle,
      ];
}
