import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/init/app_init_state.dart';
import 'package:flutter_my_portfolio/bloc/global/route/app_route_cubit.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/repository/app_init_repository.dart';
import 'package:flutter_my_portfolio/repository/auth_repository.dart';

///앱 초기화 Cubit
class AppInitCubit extends Cubit<AppInitState> {
  AppInitCubit({
    required this.appInitRepository,
    required this.authRepository,
    required this.appRouteCubit,
  }) : super(const AppInitState());

  final AppInitRepository appInitRepository;
  final AuthRepository authRepository;

  final AppRouteCubit appRouteCubit;

  Future<void> appInitializerProcess({required AppInitializerStep step}) async {
    switch (step) {
      case AppInitializerStep.STEP_1:
        await locationPermissionCheck();
        break;
      case AppInitializerStep.STEP_2:
        await checkLocal();
        break;
      case AppInitializerStep.STEP_3:
        await authInit();
        break;
      case AppInitializerStep.STEP_4:
        break;
      default:
        break;
    }
  }

  ///STEP 1 : 위치 권한 확인
  //localizations 초기화를 위해 사용자 위치 확인을 하기전 권한 체크
  //권한이 있든, 없든, STEP.2로 갈수밖에 없음. 하지만 권한을 요청을 위해서 notLocationPermission가 필요함
  Future<void> locationPermissionCheck() async {
    //권한 체크
    bool? hasPermission = await appInitRepository.checkLocal();

    //사실, 권한 있음or없음이 아닌, 권한을 요청한적이 있는가?
    if (hasPermission != null) {
      //권한 있음, next
      appInitializerProcess(step: AppInitializerStep.STEP_2);
    } else {
      //권한 없음, 권한 요청
      emit(state.copyWith(processState: AppInitializerProcessState.notLocationPermission));
    }
  }

  ///STEP 2 : localizations 초기화,
  //1.사용자의 위치를 확인해야 한다
  //2.권한이 있다면 위치 확인 후 localizations 초기화
  Future<void> checkLocal() async {
    await appInitRepository.checkLocal();

    emit(state.copyWith(processState: AppInitializerProcessState.setLocale));
  }

  ///STEP 3 : auth관련 초기화
  //유저 정보등.. 초기화하기
  Future<void> authInit() async {
    await authRepository.getUserInfoList();
  }

  ///위치 권한 요청 메소드
  //위치 권한이 없을때 호출할 메소드
  Future<void> requestLocationPermission() async {
    await appInitRepository.requestLocationPermission();
  }

  Locale? get locale => appInitRepository.locale;
}
