import 'package:flutter/material.dart';

class FlamePage extends StatefulWidget {
  static const String routePath = '/main/flame_page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => FlamePage());
  }

  @override
  _FlamePageState createState() => _FlamePageState();
}

class _FlamePageState extends State<FlamePage>{

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}