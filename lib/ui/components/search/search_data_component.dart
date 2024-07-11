import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/search/search_image_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchDataComponent extends StatelessWidget {
  const SearchDataComponent({
    super.key,
    required this.searchImageData,
    required this.isFavorites,
    required this.favoritesEvent,
    required this.imageViewEvent,
  });

  final SearchImageData searchImageData;
  final bool isFavorites;
  final VoidCallback favoritesEvent;
  final VoidCallback imageViewEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: favoritesEvent,
            child: Icon(
              (isFavorites) ? Icons.bookmark_outlined : Icons.bookmark_border,
              size: 50.w,
            ),
          ),
          GestureDetector(
            onTap: imageViewEvent,
            child: Row(
              children: [
                SizedBox(
                  width: 200.w,
                  height: 100.h,
                  child: Image.network(
                    searchImageData.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 100.h,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        searchImageData.collection,
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      Text(
                        (searchImageData.displaySiteName.isEmpty) ? '데이터 없음' : searchImageData.displaySiteName,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: (searchImageData.displaySiteName.isEmpty) ? Colors.red : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
