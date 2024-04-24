import 'package:equatable/equatable.dart';

///지번주소
class NumberAddress extends Equatable {
  ///
  NumberAddress({
    required this.addressName,
    required this.region1DepthName,
    required this.region2DepthName,
    required this.region3DepthName,
    required this.region3DepthHName,
    required this.hCode,
    required this.bCode,
    required this.mountainYn,
    required this.mainAddressNo,
    required this.subAddressNo,
    required this.x,
    required this.y,
  });

  ///
  factory NumberAddress.fromJson({required Map<String, dynamic> json}) {
    return NumberAddress(
      addressName: json['address_name'],
      region1DepthName: json['region_1depth_name'],
      region2DepthName: json['region_2depth_name'],
      region3DepthName: json['region_3depth_name'],
      region3DepthHName: json['region_3depth_h_name'],
      hCode: json['h_code'],
      bCode: json['b_code'],
      mountainYn: json['mountain_yn'],
      mainAddressNo: json['main_address_no'],
      subAddressNo: json['sub_address_no'],
      x: json['x'],
      y: json['y'],
    );
  }

  ///전체 지번 주소
  final String addressName;

  ///지역 1 Depth, 시도 단위
  final String region1DepthName;

  ///지역 2 Depth, 구 단위
  final String region2DepthName;

  ///지역 3 Depth, 동 단위
  final String region3DepthName;

  ///지역 3 Depth, 행정동 명칭
  final String region3DepthHName;

  ///행정 코드
  final String hCode;

  ///법정 코드
  final String bCode;

  ///산 여부, Y 또는 N
  final String mountainYn;

  ///지번 주번지
  final String mainAddressNo;

  ///지번 부번지, 없을 경우 빈 문자열("") 반환
  final String subAddressNo;

  ///X 좌표값, 경위도인 경우 경도(longitude)
  final String x;

  ///Y 좌표값, 경위도인 경우 위도(latitude)
  final String y;

  @override
  List<Object?> get props => [
        this.addressName,
        this.region1DepthName,
        this.region2DepthName,
        this.region3DepthName,
        this.region3DepthHName,
        this.hCode,
        this.bCode,
        this.mountainYn,
        this.mainAddressNo,
        this.subAddressNo,
        this.x,
        this.y,
      ];
}
