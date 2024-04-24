import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/rest_api/number_address.dart';
import 'package:flutter_my_portfolio/data/rest_api/road_address.dart';
import 'package:flutter_my_portfolio/data/types.dart';

///주소
class Address extends Equatable {
  ///
  Address({
    required this.addressName,
    required this.addressType,
    required this.x,
    required this.y,
    required this.numberAddress,
    required this.roadAddress,
    this.addressDetail,
  });

  ///
  factory Address.fromJson({required Map<String, dynamic> json}) {
    String addressTypeStr = json['address_type'];
    AddressType addressType = AddressType.UNKNOWN;

    switch (addressTypeStr) {
      case 'REGION':
        addressType = AddressType.REGION;
        break;
      case 'ROAD':
        addressType = AddressType.ROAD;
        break;
      case 'REGION_ADDR':
        addressType = AddressType.REGION_ADDR;
        break;
      case 'ROAD_ADDR':
        addressType = AddressType.ROAD_ADDR;
        break;
      default:
    }

    return Address(
      addressName: json['address_name'],
      addressType: addressType,
      x: json['x'],
      y: json['y'],
      numberAddress: (json['address'] != null) ? NumberAddress.fromJson(json: json['address']) : null,
      roadAddress: (json['road_address'] != null) ? RoadAddress.fromJson(json: json['road_address']) : null,
      addressDetail: json['addressDetail'],
    );
  }

  ///
  static List<Address> fromJsonList({required List<dynamic> jsonArray}) {
    return [
      for (dynamic json in jsonArray) Address.fromJson(json: json as Map<String, dynamic>),
    ];
  }

  ///
  static String toJson({required Address addressData}) {
    String addressType = '';

    switch (addressData.addressType) {
      case AddressType.REGION:
        addressType = 'REGION';
        break;
      case AddressType.ROAD:
        addressType = 'ROAD';
        break;
      case AddressType.REGION_ADDR:
        addressType = 'REGION_ADDR';
        break;
      case AddressType.ROAD_ADDR:
        addressType = 'ROAD_ADDR';
        break;
      default:
    }
    Map<String, String>? address;

    if (addressData.numberAddress != null) {
      address = {
        'address_name': addressData.numberAddress!.addressName,
        'b_code': addressData.numberAddress!.bCode,
        'h_code': addressData.numberAddress!.hCode,
        'main_address_no': addressData.numberAddress!.mainAddressNo,
        'mountain_yn': addressData.numberAddress!.mountainYn,
        'region_1depth_name': addressData.numberAddress!.region1DepthName,
        'region_2depth_name': addressData.numberAddress!.region2DepthName,
        'region_3depth_h_name': addressData.numberAddress!.region3DepthHName,
        'region_3depth_name': addressData.numberAddress!.region3DepthName,
        'sub_address_no': addressData.numberAddress!.subAddressNo,
        'x': addressData.numberAddress!.x,
        'y': addressData.numberAddress!.y,
      };
    }
    Map<String, String>? roadAddress;
    if (addressData.roadAddress != null) {
      roadAddress = {
        'address_name': addressData.roadAddress!.addressName,
        'building_name': addressData.roadAddress!.buildingName,
        'main_building_no': addressData.roadAddress!.mainBuildingNo,
        'region_1depth_name': addressData.roadAddress!.region1DepthName,
        'region_2depth_name': addressData.roadAddress!.region2DepthName,
        'region_3depth_name': addressData.roadAddress!.region3DepthName,
        'road_name': addressData.roadAddress!.roadName,
        'sub_building_no': addressData.roadAddress!.subBuildingNo,
        'underground_yn': addressData.roadAddress!.undergroundYn,
        'x': addressData.roadAddress!.x,
        'y': addressData.roadAddress!.y,
        'zone_no': addressData.roadAddress!.zoneNo,
      };
    }

    Map<String, dynamic> map = {
      'address_name': addressData.addressName,
      'address_type': addressType,
      'x': addressData.x,
      'y': addressData.y,
      'address': address,
      'road_address': roadAddress,
    };

    return jsonEncode(map);
  }

  ///전체 지번 주소 또는 전체 도로명 주소, 입력에 따라 결정됨
  final String addressName;

  ///주소타입
  final AddressType addressType;

  ///x좌표
  final String x;

  ///y좌표
  final String y;

  ///지번 주소
  final NumberAddress? numberAddress;

  ///도로명 주소
  final RoadAddress? roadAddress;

  ///상세 주소
  String? addressDetail;

  @override
  List<Object?> get props => [
        addressName,
        addressType,
        x,
        y,
        numberAddress,
        roadAddress,
        addressDetail,
      ];
}
