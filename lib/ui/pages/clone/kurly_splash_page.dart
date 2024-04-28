import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
