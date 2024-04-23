import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/ui/pages/main/main_page.dart';

///로그인 이후 화면 관리 Navigator
class MainNavigator extends StatefulWidget {
  static String routePath = '/main/';

  const MainNavigator({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const MainNavigator(), settings: settings);
  }

  @override
  _MainNavigatorState createState() => _MainNavigatorState();

  ///MainNavigator가 관리하는 페이지 목록
  static final Map<String, RouteFactory> routes = {
    MainPage.routePath: MainPage.generateRoute,
  };
}

class _MainNavigatorState extends State<MainNavigator> {
  final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: const [],
      child: MultiBlocProvider(
        providers: const [],
        child: WillPopScope(
          child: Navigator(
            key: mainNavigatorKey,
            initialRoute: MainPage.routePath, //routePath,
            onGenerateRoute: (RouteSettings settings) => MainNavigator.routes[settings.name]?.call(settings),
          ),
          onWillPop: () async => !(await mainNavigatorKey.currentState!.maybePop()),
        ),
      ),
    );
  }
}
