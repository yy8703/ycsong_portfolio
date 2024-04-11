import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/data/auth/user_info.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindIdPage extends StatefulWidget {
  static const String routePath = '/auth/find_id_page';

  const FindIdPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const FindIdPage());
  }

  @override
  _FindIdPageState createState() => _FindIdPageState();
}

class _FindIdPageState extends State<FindIdPage> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(LocaleKeys.find_id_content.tr()),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 400.h,
              child: SingleChildScrollView(
                child: Column(
                  children: questionList(list: context.read<AuthCubit>().userInfoList),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> questionList({required List<UserInfo> list}) {
    List<Widget> result = [];

    if (list.isEmpty) {
      result.add(const Text('not Data'));
    } else {
      for (UserInfo data in list) {
        result.add(
          Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              border: Border.all(width: 1.w),
            ),
            child: Text(data.findQuestion),
          ),
        );
      }
    }

    return result;
  }
}
