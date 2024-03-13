import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/route/app_route_state.dart';

///전체적인 Route를 관리하는 Cubit
class AppRouteCubit extends Cubit<AppRouteState> {
  AppRouteCubit({
    required this.navigatorKey,
  }) : super(const AppRouteState());

  final GlobalKey<NavigatorState> navigatorKey;
}