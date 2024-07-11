import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/search/search_image_data.dart';
import 'package:flutter_my_portfolio/ui/fragments/search/search_image_row_list_fragment.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesTabFragment extends StatelessWidget {
  const FavoritesTabFragment({
    super.key,
    required this.favoritesDataList,
    required this.favoritesEvent,
    required this.imageViewEvent,
  });

  final List<SearchImageData> favoritesDataList;
  final ValueCallback<SearchImageData> favoritesEvent;
  final ValueCallback<SearchImageData> imageViewEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: SearchImageRowListFragment(
        searchImageDataList: favoritesDataList,
        favoritesDataList: favoritesDataList,
        favoritesEvent: favoritesEvent,
        imageViewEvent: imageViewEvent,
      ),
    );
  }
}
