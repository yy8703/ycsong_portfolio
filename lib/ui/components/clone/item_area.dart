import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/clone/item_data.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemArea extends StatelessWidget {
  const ItemArea({super.key, required this.itemData, this.isMain = false});

  final ItemData itemData;

  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: (isMain) ? 160.w : 220.w,
          height: (isMain) ? 180.h : 240.h,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(itemData.itemImageLink), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          width: (isMain) ? 160.w : 220.w,
          height: 30.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 16.sp,
              ),
              SizedBox(width: 5.w),
              Text(
                '담기',
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 160.w,
          child: Text(itemData.title, style: TextStyle(fontSize: (isMain) ? 14.sp : 17.sp), overflow: TextOverflow.ellipsis, maxLines: 2),
        ),
        SizedBox(height: 5.h),
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              '${Global.moneyFormat.format(itemData.price)}원',
              style: TextStyle(color: Colors.grey.shade400, fontSize: (isMain) ? 13.sp : 16.sp),
            ),
            Container(
              width: 50.w,
              height: 1.h,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            Text(
              '${(itemData.discountRate * 100).floor()}%',
              style: TextStyle(color: Colors.orange.shade800, fontSize: (isMain) ? 14.sp : 17.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5.w),
            Text(
              '${Global.moneyFormat.format((itemData.price - (itemData.price * itemData.discountRate)))}원',
              style: TextStyle(color: Colors.black, fontSize: (isMain) ? 14.sp : 17.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Icon(
              Icons.chat_outlined,
              size: (isMain) ? 13.sp : 17.sp,
              color: Colors.grey.shade400,
            ),
            SizedBox(width: 3.w),
            Text(
              '${itemData.reviewCnt}',
              style: TextStyle(color: Colors.grey.shade400, fontSize: (isMain) ? 13.sp : 17.sp),
            ),
          ],
        ),
      ],
    );
  }
}
