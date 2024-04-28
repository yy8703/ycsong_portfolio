import 'package:flutter/material.dart';

class KurlyMainPage extends StatefulWidget {
  static const String routePath = '/main/kurly_main_page';

  const KurlyMainPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const KurlyMainPage());
  }

  @override
  _KurlyMainPageState createState() => _KurlyMainPageState();
}

class _KurlyMainPageState extends State<KurlyMainPage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
