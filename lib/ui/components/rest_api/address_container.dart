import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/rest_api/number_address.dart';
import 'package:flutter_my_portfolio/data/rest_api/road_address.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///주소 한칸
class AddressContainer extends StatelessWidget {
  ///
  const AddressContainer({
    super.key,
    required this.addressNum,
    required this.selectAddressEvent,
    this.numberAddress,
    this.roadAddress,
  });

  ///지번 주소
  final String addressNum;

  ///주소선택 이벤트
  final VoidCallback selectAddressEvent;

  ///지번 주소
  final NumberAddress? numberAddress;

  ///도로명 주소
  final RoadAddress? roadAddress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectAddressEvent,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (addressNum.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Text(
                  addressNum,
                ),
              ),
            if (addressNum.isNotEmpty) SizedBox(height: 14.w),
            if (roadAddress != null)
              Row(
                children: [
                  Container(
                    width: 43.w,
                    height: 19.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.grey),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Text(
                      LocaleKeys.rest_api_page_road_name.tr(),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      (roadAddress!.buildingName.isNotEmpty) ? '${roadAddress!.addressName} ${roadAddress!.buildingName}' : roadAddress!.addressName,
                    ),
                  ),
                ],
              ),
            if (numberAddress != null) SizedBox(height: 10.w),
            if (numberAddress != null)
              Row(
                children: [
                  Container(
                    width: 43.w,
                    height: 19.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.grey),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Text(
                      LocaleKeys.rest_api_page_address_number.tr(),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    numberAddress!.addressName,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
