import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
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
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExpandableNotifier(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Expandable(
                      collapsed: ExpandableButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 50.h,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.w),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(LocaleKeys.sign_up_content_terms1_title.tr()),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      expanded: Column(
                        children: [
                          ExpandableButton(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              height: 50.h,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2.w),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(LocaleKeys.sign_up_content_terms1_title.tr()),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_drop_up),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10.h),
                            height: 150.w,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.w),
                            ),
                            child: SingleChildScrollView(
                              child: Text(LocaleKeys.sign_up_content_terms2_body.tr(), softWrap: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            // SizedBox(
            //   height: 200.h,
            //   child: ExpandablePanel(
            //     header: Text(LocaleKeys.sign_up_content_terms2_title.tr()),
            //     collapsed: Text(LocaleKeys.sign_up_content_terms2_body.tr(), softWrap: true, maxLines: 1, overflow: TextOverflow.ellipsis),
            //     expanded: SizedBox(
            //       width: 190.w,
            //       height: 190.h,
            //       child: SingleChildScrollView(child: Text(LocaleKeys.sign_up_content_terms2_body.tr(), softWrap: true)),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
