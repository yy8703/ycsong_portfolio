import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/search/search_image_data.dart';

class SearchState extends Equatable {
  const SearchState({
    required this.isSearching,
    this.searchImageDataList,
    this.favoritesDataList,
    this.fullImageData,
  });

  final bool isSearching;

  final List<SearchImageData>? searchImageDataList;

  final List<SearchImageData>? favoritesDataList;

  final SearchImageData? fullImageData;

  SearchState copyWith({
    bool? isSearching,
    List<SearchImageData>? searchImageDataList,
    List<SearchImageData>? favoritesDataList,
    SearchImageData? fullImageData,
  }) {
    return SearchState(
      isSearching: isSearching ?? this.isSearching,
      searchImageDataList: searchImageDataList ?? this.searchImageDataList,
      favoritesDataList: favoritesDataList ?? this.favoritesDataList,
      fullImageData: fullImageData ?? this.fullImageData,
    );
  }

  @override
  List<Object?> get props => [
        isSearching,
        searchImageDataList,
        favoritesDataList,
        fullImageData,
      ];
}
