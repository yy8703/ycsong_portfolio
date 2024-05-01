import 'package:equatable/equatable.dart';

class ItemData extends Equatable {
  ItemData({
    required this.title,
    required this.itemImageLink,
    required this.price,
    required this.discountRate,
    required this.reviewCnt,
  });
  String title;
  String itemImageLink;
  int price;
  double discountRate;
  int reviewCnt;

  @override
  List<Object> get props => [
        title,
        itemImageLink,
        price,
        discountRate,
        reviewCnt,
      ];
}
