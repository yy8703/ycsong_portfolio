import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/clone/item_data.dart';
import 'package:flutter_my_portfolio/data/clone/pop_up_data.dart';
import 'package:flutter_my_portfolio/ui/components/clone/item_area.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapMainContentFragment extends StatelessWidget {
  const TapMainContentFragment({
    super.key,
    required this.carouselController,
    required this.popUpDataList,
    required this.popUpOnTap,
    required this.onPageChanged,
    required this.popUpViewIndex,
    required this.itemDataList,
  });
  final CarouselController carouselController;
  final List<PopUpData> popUpDataList;
  final ValueCallback<int> popUpOnTap;
  final ValueCallback<int> onPageChanged;
  final int popUpViewIndex;
  final List<ItemData> itemDataList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 130.h),
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300.h,
                child: CarouselSlider.builder(
                    carouselController: carouselController,
                    itemCount: popUpDataList.length,
                    itemBuilder: (context, index, realIndex) => GestureDetector(
                          child: Image.asset(
                            popUpDataList[index].imageLink,
                            fit: BoxFit.fill,
                          ),
                          onTap: () => popUpOnTap(popUpDataList[index].order),
                        ),
                    options: CarouselOptions(
                      initialPage: popUpViewIndex,
                      height: double.infinity,
                      viewportFraction: 1,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      autoPlayInterval: const Duration(milliseconds: 4000),
                      onPageChanged: (index, reason) => onPageChanged(index),
                    )),
              ),
              Positioned(
                bottom: 15.h,
                right: 25.w,
                child: Container(
                  width: 60.w,
                  height: 18.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: const Color.fromRGBO(155, 155, 155, 0.3), borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    '${popUpViewIndex + 1}/${popUpDataList.length}',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '지금 가장 많이 담는 특가',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          '전체보기 ',
                          style: TextStyle(
                            color: CSSColor.kurlyMainColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: CSSColor.kurlyMainColor,
                          size: 17.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  '컬리 추천 특가템 최대 30%',
                  style: TextStyle(color: Colors.grey, fontSize: 17.sp),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 480.w,
                  height: 310.h,
                  child: ListView.separated(
                    itemCount: itemDataList.length,
                    itemBuilder: (context, index) => ItemArea(
                      itemData: itemDataList[index],
                      isMain: true,
                    ),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '최저가 도전',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          '전체보기 ',
                          style: TextStyle(
                            color: CSSColor.kurlyMainColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: CSSColor.kurlyMainColor,
                          size: 17.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  '컬리 추천 특가템 최대 30%',
                  style: TextStyle(color: Colors.grey, fontSize: 17.sp),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 480.w,
                  height: 310.h,
                  child: ListView.separated(
                    itemCount: itemDataList.length,
                    itemBuilder: (context, index) => ItemArea(
                      itemData: itemDataList[index],
                      isMain: true,
                    ),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 10.w),
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
