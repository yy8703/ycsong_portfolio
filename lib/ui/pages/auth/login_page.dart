import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/components/modal/instant_modal.dart';
import 'package:flutter_my_portfolio/ui/components/text_form/custom_text_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  static const String routePath = '/auth/login_page';

  const LoginPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const LoginPage(), settings: settings);
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.login_title.tr(),
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(height: 20.w),
            CustomTextForm(
              controller: idController,
              name: LocaleKeys.login_content_id.tr(),
              hintText: LocaleKeys.login_content_id_hint_text.tr(),
              maxLength: 20,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10.w),
            CustomTextForm(
              controller: passwordController,
              name: LocaleKeys.login_content_password.tr(),
              hintText: LocaleKeys.login_content_password_hint_text.tr(),
              maxLength: 20,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            SizedBox(height: 20.w),
            ElevatedButton(
              onPressed: () async {
                LoginEventState state = await context.read<AuthCubit>().login(id: idController.text, password: passwordController.text);

                switch (state) {
                  case LoginEventState.ok:
                    break;
                  case LoginEventState.notId:
                    notIdModal();
                    break;
                  case LoginEventState.wrongPassword:
                    wrongPasswordModal();
                    break;
                }
              },
              child: Text(LocaleKeys.login_title.tr()),
            ),
            SizedBox(height: 20.w),
            ElevatedButton(
              onPressed: () => context.read<AuthCubit>().moveToSignUpPage(),
              child: Text(LocaleKeys.login_content_sign_up.tr()),
            ),
            SizedBox(height: 10.w),
            ElevatedButton(
              onPressed: () => context.read<AuthCubit>().moveToFindIdPage(),
              child: Text(LocaleKeys.login_content_find_id.tr()),
            ),
            SizedBox(height: 10.w),
            ElevatedButton(
              onPressed: () => context.read<AuthCubit>().moveToFindPasswordPage(),
              child: Text(LocaleKeys.login_content_find_password.tr()),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> notIdModal() async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: LocaleKeys.login_modal_not_id.tr(),
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }

  Future<void> wrongPasswordModal() async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: LocaleKeys.login_modal_worong_password.tr(),
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }
}
