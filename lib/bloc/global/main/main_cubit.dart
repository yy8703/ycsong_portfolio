import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_state.dart';
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
}
