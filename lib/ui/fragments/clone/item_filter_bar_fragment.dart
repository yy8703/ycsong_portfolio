import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/ui/components/clone/align_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemFilterBarFragment extends StatelessWidget {
  const ItemFilterBarFragment({super.key, required this.totalCnt});

  final int totalCnt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('총 $totalCnt개', style: TextStyle(fontSize: 15.sp)),
            const Spacer(),
            Row(
              children: [
                Text('추천순', style: TextStyle(fontSize: 15.sp)),
                Icon(Icons.keyboard_arrow_down, size: 20.sp),
              ],
            ),
            SizedBox(width: 10.w),
            Row(
              children: [
                Text('필터', style: TextStyle(fontSize: 15.sp)),
                Icon(Icons.filter_alt_sharp, size: 20.sp),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AlignButton(
              width: 80.w,
              title: '배송',
            ),
            AlignButton(
              width: 80.w,
              title: '가격',
            ),
            AlignButton(
              width: 90.w,
              title: '브랜드',
            ),
            AlignButton(
              width: 80.w,
              title: '혜택',
            ),
            AlignButton(
              width: 80.w,
              title: '유형',
            ),
          ],
        ),
      ],
    );
  }
}
