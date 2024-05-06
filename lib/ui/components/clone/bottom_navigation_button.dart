import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    super.key,
    required this.icons,
    required this.color,
    required this.title,
  });

  final IconData icons;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          color: color,
          size: 40.w,
        ),
        Text(
          title,
          style: TextStyle(color: color, fontSize: 12.sp),
        ),
      ],
    );
  }
}
