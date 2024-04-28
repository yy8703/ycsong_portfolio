import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/init/app_init_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/route/app_route_cubit.dart';
import 'package:flutter_my_portfolio/repository/app_init_repository.dart';
import 'package:flutter_my_portfolio/repository/auth_repository.dart';
import 'package:flutter_my_portfolio/repository/clone_repository.dart';
import 'package:flutter_my_portfolio/repository/rest_api_repository.dart';
import 'package:flutter_my_portfolio/ui/pages/init/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> initNavigatorKey = GlobalKey<NavigatorState>();

  //repository
  late AppInitRepository appInitRepository;
  late AuthRepository authRepository;
  late RestApiRepository restApiRepository;
  late CloneRepository cloneRepository;

  //cubit
  late AppRouteCubit appRouteCubit;
  late AppInitCubit appInitCubit;

  @override
  void initState() {
    super.initState();

    appInitRepository = AppInitRepository();
    authRepository = AuthRepository();
    restApiRepository = RestApiRepository();
    cloneRepository = CloneRepository();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    appRouteCubit = AppRouteCubit(
      navigatorKey: initNavigatorKey,
    );

    appInitCubit = AppInitCubit(
      appInitRepository: appInitRepository,
      authRepository: authRepository,
      appRouteCubit: appRouteCubit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppInitRepository>.value(value: appInitRepository),
        RepositoryProvider<AuthRepository>.value(value: authRepository),
        RepositoryProvider<RestApiRepository>.value(value: restApiRepository),
        RepositoryProvider<CloneRepository>.value(value: cloneRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppInitCubit>.value(value: appInitCubit),
          BlocProvider<AppRouteCubit>.value(value: appRouteCubit),
        ],
        child: ScreenUtilInit(
          designSize: const Size(480, 720),
          builder: (context, child) => MaterialApp(
            initialRoute: SplashPage.routePath,
            debugShowCheckedModeBanner: false,
            navigatorKey: initNavigatorKey,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            onGenerateRoute: (RouteSettings settings) => context.read<AppInitCubit>().generateRoute(settings),
          ),
        ),
      ),
    );
  }
}
