import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_cubit.dart';
import 'package:flutter_my_portfolio/util/global.dart';

class KurlySplashPage extends StatefulWidget {
  static const String routePath = '/main/kurly_splash_page';

  const KurlySplashPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const KurlySplashPage());
  }

  @override
  _KurlySplashPageState createState() => _KurlySplashPageState();
}

class _KurlySplashPageState extends State<KurlySplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 2000), () => context.read<MainCubit>().moveToKurlySecondarySplashPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CSSColor.kurlyMainColor,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/clone/logo.png'),
          ],
        ),
      ),
    );
  }
}
