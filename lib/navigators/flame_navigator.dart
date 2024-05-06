import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Flame 관련 화면 관리 Navigator
class FlameNavigator extends StatefulWidget {
  static String routePath = '/flame/';

  const FlameNavigator({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const FlameNavigator(), settings: settings);
  }

  @override
  _FlameNavigatorState createState() => _FlameNavigatorState();

  ///FlameNavigator가 관리하는 페이지 목록
  static final Map<String, RouteFactory> routes = {};
}

class _FlameNavigatorState extends State<FlameNavigator> {
  final GlobalKey<NavigatorState> flameNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: const [],
      child: MultiBlocProvider(
        providers: const [],
        child: WillPopScope(
          child: Navigator(
            key: flameNavigatorKey,
            initialRoute: null, //routePath,
            onGenerateRoute: (RouteSettings settings) => FlameNavigator.routes[settings.name]?.call(settings),
          ),
          onWillPop: () async => !(await flameNavigatorKey.currentState!.maybePop()),
        ),
      ),
    );
  }
}
