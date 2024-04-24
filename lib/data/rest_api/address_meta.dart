import 'package:equatable/equatable.dart';

///
class AddressMeta extends Equatable {
  ///
  AddressMeta({
    required this.pageIndex,
    required this.inputAddress,
    required this.totalCount,
    required this.pageAbleCount,
    required this.isEnd,
  });

  factory AddressMeta.fromJson({required Map<String, dynamic> json, required int pageIndex, required String inputAddress}) {
    return AddressMeta(
      pageIndex: pageIndex,
      inputAddress: inputAddress,
      totalCount: json['total_count'],
      pageAbleCount: json['pageable_count'],
      isEnd: json['is_end'],
    );
  }

  ///현재 페이지
  int pageIndex;

  ///내가 입력한 주소
  String inputAddress;

  ///페이지 수
  int totalCount;

  ///페이지
  int pageAbleCount;

  ///끝
  bool isEnd;

  @override
  List<Object?> get props => [
        pageIndex,
        inputAddress,
        totalCount,
        pageAbleCount,
        isEnd,
      ];
}
