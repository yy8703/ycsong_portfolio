import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/clone/clone_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_cubit.dart';
import 'package:flutter_my_portfolio/repository/clone_repository.dart';
import 'package:flutter_my_portfolio/ui/pages/chart/chart_main_page.dart';
import 'package:flutter_my_portfolio/ui/pages/clone/kurly_main_page.dart';
import 'package:flutter_my_portfolio/ui/pages/clone/kurly_secondary_splash_page.dart';
import 'package:flutter_my_portfolio/ui/pages/clone/kurly_splash_page.dart';
import 'package:flutter_my_portfolio/ui/pages/main/main_page.dart';
import 'package:flutter_my_portfolio/ui/pages/rest_api/rest_api_main_page.dart';

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

    //REST API
    RestApiMainPage.routePath: RestApiMainPage.generateRoute,

    //Clone
    KurlySplashPage.routePath: KurlySplashPage.generateRoute,
    KurlySecondarySplashPage.routePath: KurlySecondarySplashPage.generateRoute,
    KurlyMainPage.routePath: KurlyMainPage.generateRoute,

    //Chart
    ChartMainPage.routePath: ChartMainPage.generateRoute,
  };
}

class _MainNavigatorState extends State<MainNavigator> {
  final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

  //repository
  late CloneRepository cloneRepository;

  //cubit
  late MainCubit mainCubit;
  late CloneCubit cloneCubit;

  @override
  void initState() {
    super.initState();
    cloneRepository = context.read<CloneRepository>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainCubit = MainCubit(mainNavigatorKey: mainNavigatorKey);
    cloneCubit = CloneCubit(cloneRepository: cloneRepository);
  }

  @override
  Widget build(BuildContext context) {
    // return MultiRepositoryProvider(
    //   providers: const [],
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>.value(value: mainCubit),
        BlocProvider<CloneCubit>.value(value: cloneCubit),
      ],
      child: WillPopScope(
        child: Navigator(
          key: mainNavigatorKey,
          initialRoute: MainPage.routePath, //routePath,
          onGenerateRoute: (RouteSettings settings) => MainNavigator.routes[settings.name]?.call(settings),
        ),
        onWillPop: () async => !(await mainNavigatorKey.currentState!.maybePop()),
      ),
    );
    // );
  }
}
