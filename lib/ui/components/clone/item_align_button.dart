import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemAlignButton extends StatelessWidget {
  const ItemAlignButton({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: Colors.purple.shade50,
              border: (isSelected) ? Border.all(width: 2.w, color: CSSColor.kurlyMainColor) : null,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            color: (isSelected) ? CSSColor.kurlyMainColor : Colors.black,
            fontWeight: (isSelected) ? FontWeight.bold : null,
          ),
        ),
      ],
    );
  }
}
