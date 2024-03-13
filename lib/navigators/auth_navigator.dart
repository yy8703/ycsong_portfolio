import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/login_page.dart';

///로그인 이전 화면 관리 Navigator
class AuthNavigator extends StatefulWidget {
  static String routePath = '/auth/';

  const AuthNavigator({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const AuthNavigator(), settings: settings);
  }

  @override
  _AuthNavigatorState createState() => _AuthNavigatorState();

  ///AuthNavigator가 관리하는 페이지 목록
  static final Map<String, RouteFactory> routes = {
    LoginPage.routePath: LoginPage.generateRoute,
  };
}

class _AuthNavigatorState extends State<AuthNavigator> {
  final GlobalKey<NavigatorState> authNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: const [],
      child: MultiBlocProvider(
        providers: const [],
        child: WillPopScope(
          child: Navigator(
            key: authNavigatorKey,
            initialRoute: LoginPage.routePath,
            onGenerateRoute: (RouteSettings settings) => AuthNavigator.routes[settings.name]?.call(settings),
          ),
          onWillPop: () async => !(await authNavigatorKey.currentState!.maybePop()),
        ),
      ),
    );
  }
}
