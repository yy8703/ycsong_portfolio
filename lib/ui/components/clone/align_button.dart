import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlignButton extends StatelessWidget {
  const AlignButton({
    super.key,
    required this.width,
    required this.title,
  });

  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 30.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black54,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, size: 20.sp, color: Colors.black54),
        ],
      ),
    );
  }
}
