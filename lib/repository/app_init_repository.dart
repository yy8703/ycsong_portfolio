import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:location/location.dart';

class AppInitRepository {
  Location location = Location();
  Locale? locale;
  Future<bool?> checkLocal() async {
    Location location = Location();
    bool? result;

    bool serviceEnabled = await location.serviceEnabled();

    if (serviceEnabled) {
      return null;
    }

    //permission_handler 사용, 권한체크
    PermissionStatus status = await location.hasPermission();

    //허용빼곤 false로 돌려주기
    switch (status) {
      case PermissionStatus.granted: //허용
        result = true;
        break;
      case PermissionStatus.deniedForever: //영구적 거절
      case PermissionStatus.grantedLimited: //제한적
        result = false;
        break;
      case PermissionStatus.denied: //없음
        break;
      default:
        // ?? 모든 case를 적었지만, 그래도 모르니
        result = false;
        break;
    }

    return result;
  }

  //location 사용, 위치 확인
  Future<void> getLocation() async {
    LocationData? data;

    //checkLocal과 같은 로직을 한번더 해야하는데, 그럴필욘 없으므로,
    //혹시 모르니 에러가 안나도록 try, catch로 묶기
    try {
      Location location = Location();
      data = await location.getLocation();
    } catch (e) {
      //... 같은 로직을 한번더 해야하는데, ... << 를 안해서
      logger.e(e);
    }

    //latitude 위도,
    //longitude 경도,
    //대한민국 기준, 위도 33~43, 경도 124~132

    //위도, 경도가 null일 수 있다 null이라면 기본값으로
    if (data != null && data.latitude != null && data.longitude != null) {
      ///위도, 경도 조건 검사
      if ((data.latitude! >= 33 && data.latitude! <= 43) && (data.longitude! >= 124 && data.longitude! <= 132)) {
        //대한민국
        locale = const Locale('ko', 'KR');
      } else {
        //이외
        locale = const Locale('en', 'US');
      }
    } else {
      locale = const Locale('en', 'US');
    }
  }

  //여기서 묻기만 한다,
  //더 깊게 들어갈 이유가 없음, 권한이 있다면 그 권한으로 위치 잡아주고,
  //없으면 없는대로 default 설정해주면 되므로, 묻는것까지만 구현한다.
  Future<void> requestLocationPermission() async {
    Location location = Location();
    await location.requestPermission();
  }
}
