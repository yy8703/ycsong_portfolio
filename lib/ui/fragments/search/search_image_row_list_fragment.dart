import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/search/search_image_data.dart';
import 'package:flutter_my_portfolio/ui/components/search/search_data_component.dart';
import 'package:flutter_my_portfolio/util/global.dart';

class SearchImageRowListFragment extends StatelessWidget {
  const SearchImageRowListFragment({
    super.key,
    required this.searchImageDataList,
    required this.favoritesDataList,
    required this.favoritesEvent,
    required this.imageViewEvent,
    this.isSearching,
  });

  final List<SearchImageData> searchImageDataList;
  final List<SearchImageData> favoritesDataList;
  final ValueCallback<SearchImageData> favoritesEvent;
  final ValueCallback<SearchImageData> imageViewEvent;
  final bool? isSearching;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: searchDataComponentList(),
      ),
    );
  }

  List<Widget> searchDataComponentList() {
    List<Widget> result = [];

    for (SearchImageData data in searchImageDataList) {
      result.add(SearchDataComponent(
        searchImageData: data,
        isFavorites: favoritesDataList.contains(data),
        favoritesEvent: () => favoritesEvent(data),
        imageViewEvent: () => imageViewEvent(data),
      ));
    }

    if (result.isEmpty && isSearching == true) {
      return const [CircularProgressIndicator()];
    }

    return result;
  }
}
