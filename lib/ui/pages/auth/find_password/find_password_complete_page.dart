import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/bloc/local/find/find_cubit.dart';
import 'package:flutter_my_portfolio/bloc/local/find/find_state.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindPasswordCompletePage extends StatefulWidget {
  static const String routePath = '/auth/find_password_complete_page';

  const FindPasswordCompletePage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const FindPasswordCompletePage());
  }

  @override
  _FindPasswordCompletePageState createState() => _FindPasswordCompletePageState();
}

class _FindPasswordCompletePageState extends State<FindPasswordCompletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.find_password_title.tr()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(LocaleKeys.find_password_your_password.tr()),
            SizedBox(height: 20.h),
            BlocBuilder<FindCubit, FindState>(
              builder: (context, state) => (state.selectdUserInfo?.password != null)
                  ? Text(
                      state.selectdUserInfo!.password,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      LocaleKeys.find_password_fail.tr(),
                    ),
            ),
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
