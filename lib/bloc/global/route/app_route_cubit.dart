import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/route/app_route_state.dart';
import 'package:flutter_my_portfolio/navigators/auth_navigator.dart';
import 'package:flutter_my_portfolio/navigators/main_navigator.dart';

///전체적인 Route를 관리하는 Cubit
class AppRouteCubit extends Cubit<AppRouteState> {
  AppRouteCubit({
    required this.navigatorKey,
  }) : super(const AppRouteState());

  final GlobalKey<NavigatorState> navigatorKey;

  Future<void> moveToAuthNavigator() async {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(AuthNavigator.routePath, (route) => false);
  }

  Future<void> moveToMainNavigator() async {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(MainNavigator.routePath, (route) => false);
  }
}
