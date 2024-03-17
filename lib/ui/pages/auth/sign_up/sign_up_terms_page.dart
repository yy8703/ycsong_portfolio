import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_state.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/components/sign_up/sign_up_terms_check_box_component.dart';
import 'package:flutter_my_portfolio/ui/components/sign_up/sign_up_terms_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTermsPage extends StatefulWidget {
  static const String routePath = '/auth/sign_up_terms_page';

  const SignUpTermsPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SignUpTermsPage(), settings: settings);
  }

  @override
  _SignUpTermsPageState createState() => _SignUpTermsPageState();
}

class _SignUpTermsPageState extends State<SignUpTermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_up_terms_title.tr()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              children: [
                Text('${LocaleKeys.sign_up_terms_title.tr()}\n${LocaleKeys.sign_up_terms_content.tr()}'),
              ],
            ),
            SizedBox(height: 20.h),
            ExpandableNotifier(
              child: Column(
                children: [
                  SignUpTermsComponent(
                    title: LocaleKeys.sign_up_content_terms1_title.tr(),
                    body: LocaleKeys.sign_up_content_terms1_body.tr(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) => SignUpTermsCheckBoxComponent(
                isCheckd: state.signUpDataDTO?.isTerms1 ?? false,
                str: LocaleKeys.sign_up_content_terms1_ok.tr(),
                onTap: (bool isCheck) => context.read<AuthCubit>().termsAcceptEvent(value: isCheck, index: 1),
              ),
            ),
            SizedBox(height: 20.h),
            ExpandableNotifier(
              child: Column(
                children: [
                  SignUpTermsComponent(
                    title: LocaleKeys.sign_up_content_terms2_title.tr(),
                    body: LocaleKeys.sign_up_content_terms2_body.tr(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) => SignUpTermsCheckBoxComponent(
                isCheckd: state.signUpDataDTO?.isTerms2 ?? false,
                str: LocaleKeys.sign_up_content_terms1_ok.tr(),
                onTap: (bool isCheck) => context.read<AuthCubit>().termsAcceptEvent(value: isCheck, index: 2),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {},
              child: Text(LocaleKeys.sign_up_content_next.tr()),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
