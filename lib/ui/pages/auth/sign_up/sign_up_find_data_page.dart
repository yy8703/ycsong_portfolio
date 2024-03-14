import 'package:flutter/material.dart';

class SignUpFindDataPage extends StatefulWidget {
  static const String routePath = '/auth/sign_up_find_data_page';

  const SignUpFindDataPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SignUpFindDataPage(), settings: settings);
  }

  @override
  _SignUpFindDataPageState createState() => _SignUpFindDataPageState();
}

class _SignUpFindDataPageState extends State<SignUpFindDataPage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
