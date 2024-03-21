import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_up_id_title.tr()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: const Column(),
      ),
    );
  }
}
