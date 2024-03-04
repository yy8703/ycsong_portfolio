import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/route/app_init_route_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> initNavigatorKey = GlobalKey<NavigatorState>();

  //repository

  //cubit
  late AppInitRouteCubit appInitRouteCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    appInitRouteCubit = AppInitRouteCubit(navigatorKey: initNavigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: const [],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppInitRouteCubit>.value(value: appInitRouteCubit),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: initNavigatorKey,
        ),
      ),
    );
  }
}
