import 'package:equatable/equatable.dart';

class TapBarData extends Equatable {
  const TapBarData({
    required this.title,
  });

  //타이틀
  final String title;

  @override
  List<Object> get props => [
        title,
      ];
}
