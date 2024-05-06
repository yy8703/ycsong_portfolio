import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/clone/item_data.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_align_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_filter_bar_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/item_grid_view_fragment.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapNewProductContentFragment extends StatelessWidget {
  const TapNewProductContentFragment({
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
            buttonTitle1: '인기신상랭킹',
            buttonTitle2: '입점특가',
            buttonTitle3: '간편한끼',
            buttonTitle4: '요즘간식',
            buttonTitle5: '주방·리빙',
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
