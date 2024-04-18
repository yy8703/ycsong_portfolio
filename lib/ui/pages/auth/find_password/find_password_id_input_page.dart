import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindPasswordIdInputPage extends StatefulWidget {
  static const String routePath = '/auth/find_password_id_input_page';

  const FindPasswordIdInputPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const FindPasswordIdInputPage());
  }

  @override
  _FindPasswordIdInputPageState createState() => _FindPasswordIdInputPageState();
}

class _FindPasswordIdInputPageState extends State<FindPasswordIdInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.find_id_title.tr()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            Text(LocaleKeys.find_id_content.tr()),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
