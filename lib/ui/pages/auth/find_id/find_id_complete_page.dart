import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindIdCompletePage extends StatefulWidget {
  static const String routePath = '/auth/find_id_complete_page';

  const FindIdCompletePage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const FindIdCompletePage());
  }

  @override
  _FindIdCompletePageState createState() => _FindIdCompletePageState();
}

class _FindIdCompletePageState extends State<FindIdCompletePage> {
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
