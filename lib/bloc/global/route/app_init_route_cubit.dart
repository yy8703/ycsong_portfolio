import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/route/app_init_route_state.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/repository/app_init_repository.dart';

///전체적인 Route를 관리하는 Cubit
class AppInitRouteCubit extends Cubit<AppInitRouteState> {
  AppInitRouteCubit({
    required this.navigatorKey,
    required this.appInitRepository,
  }) : super(AppInitRouteState());

  final GlobalKey<NavigatorState> navigatorKey;
  
  final AppInitRepository appInitRepository;

  Future<void> appInitializerProcess({required AppInitializerStep step}) async {
    switch (step) {
      case AppInitializerStep.STEP_1:
        break;
      default:
        break;
    }
  }

  ///STEP 1 : 위치 권한 확인
  //localizations 초기화를 위해 사용자 위치 확인을 하기전 권한 체크
  Future<void> locationPermissionCheck() async {
    bool hasPermission = false;

    //기기별 권한체크
    if (Platform.isIOS) {
      hasPermission = 
    } else {}
  }

  ///STEP 1 : localizations 초기화,
  //1.사용자의 위치를 확인해야 한다
  //2.위치 확인을 위해서 권한을 확인한다
  //3.권한이 없다면 권한 요청을, 권한이 있다면 위치 확인을
  //3-1.권한이 없다면 권한 요청 후 다시 STEP.1 진행
  //3-2.권한이 있다면 위치 확인 후 localizations 초기화
  Future<void> checkLocal() async {}
}
