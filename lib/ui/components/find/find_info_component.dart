import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/auth/user_info.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindInfoComponent extends StatelessWidget {
  const FindInfoComponent({
    super.key,
    required this.info,
    required this.tapEvent,
    this.selectdUserInfo,
  });

  final UserInfo info;
  final ValueCallback<UserInfo> tapEvent;
  final UserInfo? selectdUserInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => tapEvent(info),
      child: Container(
        width: double.infinity,
        height: 30.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: (info == selectdUserInfo) ? Colors.blue : null,
          border: Border(bottom: BorderSide(width: 1.w)),
        ),
        child: Text(info.findQuestion),
      ),
    );
  }
}
