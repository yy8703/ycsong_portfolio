import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapBarButton extends StatelessWidget {
  const TapBarButton({
    super.key,
    required this.buttonTitle,
    required this.isSeleted,
    required this.onTapEvent,
  });

  final String buttonTitle;
  final bool isSeleted;
  final ValueCallback<String> onTapEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 13.w),
        alignment: Alignment.center,
        height: double.infinity,
        decoration: (isSeleted) ? BoxDecoration(border: Border(bottom: BorderSide(width: 2.w, color: CSSColor.kurlyMainColor))) : null,
        child: Text(
          buttonTitle,
          style: TextStyle(color: (isSeleted) ? CSSColor.kurlyMainColor : Colors.grey, fontSize: 20.sp, fontWeight: (isSeleted) ? FontWeight.bold : null),
        ),
      ),
      onTap: () => onTapEvent(buttonTitle),
    );
  }
}
