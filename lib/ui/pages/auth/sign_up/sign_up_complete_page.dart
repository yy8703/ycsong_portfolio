import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_up_complete_title.tr()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            Text(LocaleKeys.sign_up_complete_title.tr()),
            SizedBox(height: 20.h),
            Text(LocaleKeys.sign_up_complete_content.tr()),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () => context.read<AuthCubit>().moveToLoginPage(),
              child: Text(LocaleKeys.sign_up_content_next.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
