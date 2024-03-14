import 'package:flutter/material.dart';

class SignUpCompletePage extends StatefulWidget {
  static const String routePath = '/auth/sign_up_complete_page';

  const SignUpCompletePage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SignUpCompletePage(), settings: settings);
  }

  @override
  _SignUpCompletePageState createState() => _SignUpCompletePageState();
}

class _SignUpCompletePageState extends State<SignUpCompletePage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
