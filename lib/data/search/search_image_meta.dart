import 'package:equatable/equatable.dart';

class SearchImageMeta extends Equatable {
  const SearchImageMeta({
    required this.pageIndex,
    required this.totalCount,
    required this.pageableCount,
    required this.searchStr,
    required this.isEnd,
  });

//현재
  final int pageIndex;
//전체
  final int totalCount;
  //페이지
  final int pageableCount;

//내검색어
  final String searchStr;
  //끝 여부
  final bool isEnd;

  factory SearchImageMeta.fromJson({required Map<String, dynamic> json, required int index, required String str}) {
    return SearchImageMeta(
      pageIndex: index,
      totalCount: json['total_count'],
      pageableCount: json['pageable_count'],
      searchStr: str,
      isEnd: json['is_end'],
    );
  }

  @override
  List<Object?> get props => [
        totalCount,
        pageableCount,
        isEnd,
      ];
}
