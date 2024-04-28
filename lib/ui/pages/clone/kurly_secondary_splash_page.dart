import 'package:flutter/material.dart';

class KurlySecondarySplashPage extends StatefulWidget {
  static const String routePath = '/main/kurly_secondary_splash_page';

  const KurlySecondarySplashPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const KurlySecondarySplashPage());
  }

  @override
  _KurlySecondarySplashPageState createState() => _KurlySecondarySplashPageState();
}

class _KurlySecondarySplashPageState extends State<KurlySecondarySplashPage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
