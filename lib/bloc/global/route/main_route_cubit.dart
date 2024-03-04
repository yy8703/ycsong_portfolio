import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/route/main_route_state.dart';

///전체적인 Route를 관리하는 Cubit
class MainRouteCubit extends Cubit<MainRouteState> {
  MainRouteCubit({
    required this.mainNavigatorKey,
  }) : super(MainRouteState());

  final GlobalKey<NavigatorState> mainNavigatorKey;
}
