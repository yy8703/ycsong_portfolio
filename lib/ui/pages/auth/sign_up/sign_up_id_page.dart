import 'package:flutter/material.dart';

class SignUpIdPage extends StatefulWidget {
  static const String routePath = '/auth/sign_up_id_page';

  const SignUpIdPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SignUpIdPage(), settings: settings);
  }

  @override
  _SignUpIdPageState createState() => _SignUpIdPageState();
}

class _SignUpIdPageState extends State<SignUpIdPage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
