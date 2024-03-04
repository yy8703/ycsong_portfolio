import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/route/flame_route_state.dart';

///전체적인 Route를 관리하는 Cubit
class FlameRouteCubit extends Cubit<FlameRouteState> {
  FlameRouteCubit({
    required this.flameNavigatorKey,
  }) : super(FlameRouteState());

  final GlobalKey<NavigatorState> flameNavigatorKey;
}
