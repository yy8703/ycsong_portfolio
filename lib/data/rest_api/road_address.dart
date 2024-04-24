import 'package:equatable/equatable.dart';

///도로명 주소
class RoadAddress extends Equatable {
  ///
  const RoadAddress({
    required this.addressName,
    required this.buildingName,
    required this.mainBuildingNo,
    required this.region1DepthName,
    required this.region2DepthName,
    required this.region3DepthName,
    required this.roadName,
    required this.subBuildingNo,
    required this.undergroundYn,
    required this.x,
    required this.y,
    required this.zoneNo,
  });

  ///도로명 주소
  factory RoadAddress.fromJson({required Map<String, dynamic> json}) {
    return RoadAddress(
      addressName: json['address_name'],
      buildingName: json['building_name'],
      mainBuildingNo: json['main_building_no'],
      region1DepthName: json['region_1depth_name'],
      region2DepthName: json['region_2depth_name'],
      region3DepthName: json['region_3depth_name'],
      roadName: json['road_name'],
      subBuildingNo: json['sub_building_no'],
      undergroundYn: json['underground_yn'],
      x: json['x'],
      y: json['y'],
      zoneNo: json['zone_no'],
    );
  }

  ///전체 도로명 주소
  final String addressName;

  ///지역명1
  final String buildingName;

  ///지역명2
  final String mainBuildingNo;

  ///지역명3
  final String region1DepthName;

  ///도로명
  final String region2DepthName;

  ///지하 여부, Y 또는 N
  final String region3DepthName;

  ///건물 본번
  final String roadName;

  ///건물 부번, 없을 경우 빈 문자열("") 반환
  final String subBuildingNo;

  ///건물 이름
  final String undergroundYn;

  ///X 좌표값, 경위도인 경우 경도(longitude)
  final String x;

  ///Y 좌표값, 경위도인 경우 위도(latitude)
  final String y;

  ///우편번호(5자리)
  final String zoneNo;

  @override
  List<Object?> get props => [
        addressName,
        buildingName,
        mainBuildingNo,
        region1DepthName,
        region2DepthName,
        region3DepthName,
        roadName,
        subBuildingNo,
        undergroundYn,
        x,
        y,
        zoneNo,
      ];
}
