import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/data/rest_api/address.dart';
import 'package:flutter_my_portfolio/data/rest_api/address_meta.dart';
import 'package:flutter_my_portfolio/ui/components/rest_api/address_container.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///주소영역
class AddressArea extends StatelessWidget {
  ///
  const AddressArea({
    super.key,
    required this.addressMeta,
    required this.addressList,
    required this.selectAddressReturnEvent,
    required this.addressAreaScrollEvent,
  });

  ///주소 리스트에 대한 정보
  final AddressMeta? addressMeta;

  ///주소리스트
  final List<Address>? addressList;

  ///주소 반환 이벤트
  final ValueCallback<Address> selectAddressReturnEvent;

  ///스크롤 이벤트
  final VoidCallback addressAreaScrollEvent;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (addressMeta != null && !addressMeta!.isEnd) {
        if (scrollController.offset >= scrollController.position.maxScrollExtent) {
          addressAreaScrollEvent();
        }
      }
    });
    return (addressList != null)
        ? SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: addressListWidget(addressList: addressList!),
            ),
          )
        : Container();
  }

  ///
  List<Widget> addressListWidget({required List<Address> addressList}) {
    List<Widget> result = [];

    for (Address data in addressList) {
      result.add(Column(
        children: [
          AddressContainer(
            addressNum: data.roadAddress?.zoneNo ?? '',
            selectAddressEvent: () => selectAddressReturnEvent(data),
            numberAddress: data.numberAddress,
            roadAddress: data.roadAddress,
          ),
          Column(
            children: [
              SizedBox(height: 5.h),
              Divider(
                height: 1.w,
                color: Colors.grey,
                thickness: 1.w,
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ],
      ));
    }

    return result;
  }
}
