import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_state.dart';
import 'package:flutter_my_portfolio/ui/pages/chart/chart_main_page.dart';
import 'package:flutter_my_portfolio/ui/pages/clone/kurly_main_page.dart';
import 'package:flutter_my_portfolio/ui/pages/clone/kurly_secondary_splash_page.dart';
import 'package:flutter_my_portfolio/ui/pages/clone/kurly_splash_page.dart';
import 'package:flutter_my_portfolio/ui/pages/main/main_page.dart';
import 'package:flutter_my_portfolio/ui/pages/rest_api/rest_api_main_page.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required this.mainNavigatorKey,
  }) : super(MainState());

  final GlobalKey<NavigatorState> mainNavigatorKey;

  Future<void> movoToMainPage() async {
    mainNavigatorKey.currentState!.pushNamedAndRemoveUntil(MainPage.routePath, (route) => false);
  }

  Future<void> moveToRestAPIPage() async {
    mainNavigatorKey.currentState!.pushNamed(RestApiMainPage.routePath);
  }

  ///스플래시 1
  Future<void> moveToKurlySplashPage() async {
    mainNavigatorKey.currentState!.pushNamedAndRemoveUntil(KurlySplashPage.routePath, (route) => false);
  }

  ///스플래시 2
  Future<void> moveToKurlySecondarySplashPage() async {
    mainNavigatorKey.currentState!.pushNamedAndRemoveUntil(KurlySecondarySplashPage.routePath, (route) => false);
  }

  ///메인
  Future<void> moveToKurlyMainPage() async {
    mainNavigatorKey.currentState!.pushNamedAndRemoveUntil(KurlyMainPage.routePath, (route) => false);
  }

  ///차트
  Future<void> movoToChartPage() async {
    mainNavigatorKey.currentState!.pushNamedAndRemoveUntil(ChartMainPage.routePath, (route) => false);
  }
}
