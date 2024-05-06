import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/clone/item_data.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_align_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_filter_bar_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_grid_view_fragment.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapBastContentFragment extends StatelessWidget {
  const TapBastContentFragment({
    super.key,
    required this.selectedButtonNumber,
    required this.itemDataList,
    required this.alignEvent,
  });

  final int selectedButtonNumber;
  final List<ItemData> itemDataList;
  final ValueCallback<int> alignEvent;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 130.h),
          SizedBox(height: 10.h),
          ItemAlignFragment(
            selectedButton: selectedButtonNumber,
            buttonTitle1: 'TOP300',
            buttonTitle2: '인기급상승',
            buttonTitle3: '컬리에만있는',
            buttonTitle4: '제철신선',
            buttonTitle5: '직원추천상품',
            alignEvent: (value) => alignEvent(value),
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
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
