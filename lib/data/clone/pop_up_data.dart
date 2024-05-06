import 'package:equatable/equatable.dart';

class PopUpData extends Equatable {
  const PopUpData({
    required this.order,
    required this.imageLink,
    required this.link,
    required this.description,
  });

  final int order;
  final String imageLink;
  final int link;
  final String description;

  @override
  List<Object> get props => [
        order,
        imageLink,
        link,
        description,
      ];
}
