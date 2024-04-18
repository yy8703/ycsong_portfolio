import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/sign_up/sign_up_cubit.dart';
import 'package:flutter_my_portfolio/repository/auth_repository.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/find_id/find_id_complete_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/find_id/find_id_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/find_password/find_password_complete_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/find_password/find_password_id_input_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/find_password/find_password_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/login_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/sign_up/sign_up_complete_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/sign_up/sign_up_find_data_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/sign_up/sign_up_id_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/sign_up/sign_up_password_page.dart';
import 'package:flutter_my_portfolio/ui/pages/auth/sign_up/sign_up_terms_page.dart';

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
    SignUpCompletePage.routePath: SignUpCompletePage.generateRoute,
    SignUpFindDataPage.routePath: SignUpFindDataPage.generateRoute,
    SignUpIdPage.routePath: SignUpIdPage.generateRoute,
    SignUpPasswordPage.routePath: SignUpPasswordPage.generateRoute,
    SignUpTermsPage.routePath: SignUpTermsPage.generateRoute,
    FindIdPage.routePath: FindIdPage.generateRoute,
    FindIdCompletePage.routePath: FindIdCompletePage.generateRoute,
    FindPasswordIdInputPage.routePath: FindPasswordIdInputPage.generateRoute,
    FindPasswordPage.routePath: FindPasswordPage.generateRoute,
    FindPasswordCompletePage.routePath: FindPasswordCompletePage.generateRoute,
  };
}

class _AuthNavigatorState extends State<AuthNavigator> {
  final GlobalKey<NavigatorState> authNavigatorKey = GlobalKey<NavigatorState>();

  //repository
  late AuthRepository authRepository;

  //cubit
  late AuthCubit authCubit;
  late SignUpCubit signUpCubit;

  @override
  void initState() {
    super.initState();

    authRepository = context.read<AuthRepository>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    authCubit = AuthCubit(authNavigatorKey: authNavigatorKey, authRepository: authRepository);
    signUpCubit = SignUpCubit(authCubit: authCubit);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(value: authCubit),
        BlocProvider<SignUpCubit>.value(value: signUpCubit),
      ],
      child: WillPopScope(
        child: Navigator(
          key: authNavigatorKey,
          initialRoute: LoginPage.routePath,
          onGenerateRoute: (RouteSettings settings) => AuthNavigator.routes[settings.name]?.call(settings),
        ),
        onWillPop: () async => !(await authNavigatorKey.currentState!.maybePop()),
      ),
    );
  }
}
