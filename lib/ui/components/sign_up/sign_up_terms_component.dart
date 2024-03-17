import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTermsComponent extends StatelessWidget {
  const SignUpTermsComponent({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Expandable(
      collapsed: ExpandableButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 50.h,
          decoration: BoxDecoration(
            border: Border.all(width: 2.w),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  title,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(width: 10.w),
              const Spacer(),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      expanded: Column(
        children: [
          ExpandableButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(width: 2.w),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(title),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_up),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.h),
            height: 150.w,
            decoration: BoxDecoration(
              border: Border.all(width: 1.w),
            ),
            child: SingleChildScrollView(
              child: Text(body, softWrap: true),
            ),
          ),
        ],
      ),
    );
  }
}
