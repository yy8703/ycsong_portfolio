import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/data/auth/user_info.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/components/text_form/custom_text_form.dart';
import 'package:flutter_my_portfolio/util/global.dart';
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
  TextEditingController answerController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Text(LocaleKeys.find_id_content.tr()),
            SizedBox(height: 5.h),
            Text(LocaleKeys.find_id_content2.tr()),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              height: 250.h,
              decoration: BoxDecoration(
                border: Border.all(width: 1.w),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: questionList(
                    list: context.read<AuthCubit>().userInfoList,
                    tapEvent: (UserInfo data) {},
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Text(LocaleKeys.find_id_content3.tr()),
            SizedBox(height: 10.h),
            CustomTextForm(
              controller: answerController,
              name: LocaleKeys.find_id_title.tr(),
              hintText: '',
              maxLength: 20,
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> questionList({required List<UserInfo> list, required ValueCallback<UserInfo> tapEvent}) {
    List<Widget> result = [];

    if (list.isEmpty) {
      result.add(const Text('not Data'));
    } else {
      for (UserInfo data in list) {
        result.add(
          GestureDetector(
            onTap: () => tapEvent(data),
            child: Container(
              width: double.infinity,
              height: 30.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1.w)),
              ),
              child: Text(data.findQuestion),
            ),
          ),
        );
      }
    }

    return result;
  }
}
