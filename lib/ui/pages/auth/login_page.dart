import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/route/app_route_cubit.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/components/modal/instant_modal.dart';
import 'package:flutter_my_portfolio/ui/components/text_form/custom_login_text_form.dart';
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
            Container(
              width: 450.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 2.w),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    'PortFolio',
                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30.h),
                  CustomLoginTextForm(
                    controller: idController,
                    name: LocaleKeys.login_content_id.tr(),
                    hintText: LocaleKeys.login_content_id_hint_text.tr(),
                    maxLength: 20,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10.h),
                  CustomLoginTextForm(
                    controller: passwordController,
                    name: LocaleKeys.login_content_password.tr(),
                    hintText: LocaleKeys.login_content_password_hint_text.tr(),
                    maxLength: 20,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () async {
                      LoginEventState state = await context.read<AuthCubit>().login(id: idController.text, password: passwordController.text);

                      switch (state) {
                        case LoginEventState.ok:
                          context.read<AppRouteCubit>().moveToMainNavigator();
                          break;
                        case LoginEventState.notId:
                          notIdModal();
                          break;
                        case LoginEventState.wrongPassword:
                          wrongPasswordModal();
                          break;
                      }
                    },
                    child: Container(
                      width: 300.w,
                      height: 38.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        LocaleKeys.login_title.tr(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 300.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 110.w, height: 1.h, color: Colors.grey),
                        Text(
                          '또는',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        Container(width: 110.w, height: 1.h, color: Colors.grey),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    child: Text(
                      '메인화면으로 넘어가기',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    onTap: () => context.read<AppRouteCubit>().moveToMainNavigator(),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    child: Text(
                      LocaleKeys.login_content_sign_up.tr(),
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    onTap: () => context.read<AuthCubit>().moveToFindIdPage(),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    child: Text(
                      '비밀번호를 잊으셨나요?',
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    onTap: () => context.read<AuthCubit>().moveToFindPasswordIdInputPage(),
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () => context.read<AuthCubit>().moveToSignUpPage(),
            //   child: Text(LocaleKeys.login_content_sign_up.tr()),
            // ),
            // SizedBox(height: 10.w),
            // ElevatedButton(
            //   onPressed: () => context.read<AuthCubit>().moveToFindIdPage(),
            //   child: Text(LocaleKeys.login_content_find_id.tr()),
            // ),
            // SizedBox(height: 10.w),
            // ElevatedButton(
            //   onPressed: () => context.read<AuthCubit>().moveToFindPasswordIdInputPage(),
            //   child: Text(LocaleKeys.login_content_find_password.tr()),
            // ),
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
