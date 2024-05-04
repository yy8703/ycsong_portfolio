import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/clone/pop_up_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapSpecialOfferBenefitContentFragment extends StatelessWidget {
  const TapSpecialOfferBenefitContentFragment({super.key, required this.popUpDataList});

  final List<PopUpData> popUpDataList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 125.h, bottom: 10.h),
        child: Column(
          children: popUpListWidget(),
        ),
      ),
    );
  }

  List<Widget> popUpListWidget() {
    List<Widget> result = [];

    for (PopUpData data in popUpDataList) {
      result.add(Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: SizedBox(
          width: double.infinity,
          height: 150.h,
          child: Image.asset(data.imageLink, fit: BoxFit.fill),
        ),
      ));
    }

    return result;
  }
}
