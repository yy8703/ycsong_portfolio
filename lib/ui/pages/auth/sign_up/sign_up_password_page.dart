import 'package:flutter/material.dart';

class SignUpPasswordPage extends StatefulWidget {
  static const String routePath = '/auth/sign_up_password_page';

  const SignUpPasswordPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SignUpPasswordPage(), settings: settings);
  }

  @override
  _SignUpPasswordPageState createState() => _SignUpPasswordPageState();
}

class _SignUpPasswordPageState extends State<SignUpPasswordPage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
