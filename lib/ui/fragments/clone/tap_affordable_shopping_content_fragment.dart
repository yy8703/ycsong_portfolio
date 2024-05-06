import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/clone/item_data.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_filter_bar_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_grid_view_fragment.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapAffordableShoppingContentFragment extends StatelessWidget {
  const TapAffordableShoppingContentFragment({
    super.key,
    required this.itemDataList,
  });

  final List<ItemData> itemDataList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 130.h),
          SizedBox(
            width: double.infinity,
            height: 270.h,
            child: Image.asset('assets/images/clone/pop_up_3.png', fit: BoxFit.fill),
          ),
          Container(
            width: double.infinity,
            height: 50.h,
            color: CSSColor.kurlyMainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: '마감 세일', style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      TextSpan(text: ' 보러가기', style: TextStyle(color: Colors.white, fontSize: 20.sp)),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 15.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                ItemFilterBarFragment(totalCnt: itemDataList.length),
                ItemGridViewFragment(itemDataList: itemDataList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
