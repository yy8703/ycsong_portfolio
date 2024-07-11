import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/search/search_image_data.dart';
import 'package:flutter_my_portfolio/data/search/search_image_meta.dart';
import 'package:flutter_my_portfolio/ui/components/search/search_custom_text_form.dart';
import 'package:flutter_my_portfolio/ui/fragments/search/search_image_row_list_fragment.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTabFragment extends StatelessWidget {
  const SearchTabFragment({
    super.key,
    required this.isSearching,
    required this.searchImageDataList,
    required this.favoritesDataList,
    required this.textController,
    required this.scrollController,
    required this.searchButtonOnTap,
    required this.favoritesEvent,
    required this.imageViewEvent,
    this.searchImageMeta,
  });

  final bool isSearching;
  final List<SearchImageData> searchImageDataList;
  final List<SearchImageData> favoritesDataList;
  final TextEditingController textController;
  final ScrollController scrollController;
  final VoidCallback searchButtonOnTap;
  final ValueCallback<SearchImageData> favoritesEvent;
  final ValueCallback<SearchImageData> imageViewEvent;
  final SearchImageMeta? searchImageMeta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Row(
            children: [
              SearchCustomTextForm(
                width: 350.w,
                height: 35.h,
                controller: textController,
                name: 'search',
                hintText: '검색어를 입력해 주세요.',
                maxLength: 20,
                keyboardType: TextInputType.text,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: (isSearching) ? null : searchButtonOnTap,
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    (isSearching) ? Colors.grey : Colors.blue,
                  ),
                ),
                child: const Text('검색'),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          (searchImageMeta != null)
              ? Column(
                  children: [
                    Text('전체 이미지 ${searchImageMeta!.pageableCount} 중 ${searchImageDataList.length} 개 확인중'),
                    SizedBox(height: 10.h),
                  ],
                )
              : Container(),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: SearchImageRowListFragment(
                isSearching: isSearching,
                searchImageDataList: searchImageDataList,
                favoritesDataList: favoritesDataList,
                favoritesEvent: favoritesEvent,
                imageViewEvent: imageViewEvent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
