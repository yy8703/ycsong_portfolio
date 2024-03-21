import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_state.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/components/modal/instant_modal.dart';
import 'package:flutter_my_portfolio/ui/components/text_form/custom_text_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPasswordPage extends StatefulWidget {
  static const String routePath = '/auth/sign_up_password_page';

  const SignUpPasswordPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SignUpPasswordPage(), settings: settings);
  }

  @override
  _SignUpPasswordPageState createState() => _SignUpPasswordPageState();
}

class _SignUpPasswordPageState extends State<SignUpPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_up_password_title.tr()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            Text(LocaleKeys.sign_up_password_title.tr()),
            Text(LocaleKeys.sign_up_password_content.tr()),
            SizedBox(height: 30.h),
            Text(LocaleKeys.sign_up_content_password.tr()),
            CustomTextForm(
              name: LocaleKeys.sign_up_content_password.tr(),
              controller: passwordController,
              hintText: LocaleKeys.sign_up_content_password_hint_text.tr(),
              keyboardType: TextInputType.visiblePassword,
              maxLength: 20,
              onChanged: (value) => context.read<AuthCubit>().passwordOnChangedEvent(password: passwordController.text, confirmPassword: rePasswordController.text),
              obscureText: true,
            ),
            Text(LocaleKeys.sign_up_content_re_password.tr()),
            CustomTextForm(
              name: LocaleKeys.sign_up_content_re_password.tr(),
              controller: rePasswordController,
              hintText: LocaleKeys.sign_up_content_re_password_hint_text.tr(),
              keyboardType: TextInputType.visiblePassword,
              maxLength: 20,
              onChanged: (value) => context.read<AuthCubit>().passwordOnChangedEvent(password: passwordController.text, confirmPassword: rePasswordController.text),
              obscureText: true,
            ),
            SizedBox(height: 5.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) => Text(
                state.idRegExpState?.errorText ?? '',
                style: const TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(height: 30.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) => ElevatedButton(
                onPressed: () {
                  if (state.idRegExpState != null && state.idRegExpState!.errorText.isNotEmpty) {
                    context.read<AuthCubit>().moveToMakeFindDataPage();
                  } else {
                    passwordErrorModal(content: state.idRegExpState!.errorText);
                  }
                },
                child: Text(LocaleKeys.sign_up_content_next.tr()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> passwordErrorModal({required String content}) async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: content,
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }
}
