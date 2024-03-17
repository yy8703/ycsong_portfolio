import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTermsCheckBoxComponent extends StatelessWidget {
  const SignUpTermsCheckBoxComponent({
    super.key,
    required this.isCheckd,
    required this.str,
    required this.onTap,
  });

  final bool isCheckd;
  final String str;
  final ValueCallback<bool> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Text(str),
          const Spacer(),
          Container(
            width: 35.w,
            height: 35.w,
            decoration: BoxDecoration(
              color: (isCheckd) ? Colors.lightBlue : Colors.transparent,
              border: Border.all(width: 1.w),
            ),
            child: (isCheckd) ? const Icon(Icons.check) : Container(),
          ),
        ],
      ),
      onTap: () => onTap(!isCheckd),
    );
  }
}
