import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_cubit.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  static const String routePath = '/main/main_page';

  const MainPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const MainPage());
  }

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.main_page_title.tr()),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(LocaleKeys.main_page_content.tr()),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () => context.read<MainCubit>().moveToRestAPIPage(),
              child: Text(LocaleKeys.main_page_rest_api.tr()),
            ),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () {},
              child: Text(LocaleKeys.main_page_chart.tr()),
            ),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () {},
              child: Text(LocaleKeys.main_page_anmation.tr()),
            ),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () {},
              child: Text(LocaleKeys.main_page_clone.tr()),
            ),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () {},
              child: Text(LocaleKeys.main_page_flame.tr()),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
