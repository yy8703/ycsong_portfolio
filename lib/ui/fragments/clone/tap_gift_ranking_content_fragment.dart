import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/clone/item_data.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_filter_bar_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_grid_view_fragment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapGiftRankingContentFragment extends StatelessWidget {
  const TapGiftRankingContentFragment({
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
            height: 130.h,
            child: Image.asset('assets/images/clone/pop_up_2.png', fit: BoxFit.fill),
          ),
          SizedBox(height: 20.h),
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
