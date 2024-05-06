import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/bloc/local/find/find_cubit.dart';
import 'package:flutter_my_portfolio/bloc/local/find/find_state.dart';
import 'package:flutter_my_portfolio/data/auth/user_info.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/components/find/find_info_component.dart';
import 'package:flutter_my_portfolio/ui/components/modal/instant_modal.dart';
import 'package:flutter_my_portfolio/ui/components/text_form/custom_text_form.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindPasswordPage extends StatefulWidget {
  static const String routePath = '/auth/find_password_page';

  const FindPasswordPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const FindPasswordPage());
  }

  @override
  _FindPasswordPageState createState() => _FindPasswordPageState();
}

class _FindPasswordPageState extends State<FindPasswordPage> {
  TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(LocaleKeys.find_password_title.tr()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              Text(LocaleKeys.find_password_content.tr()),
              SizedBox(height: 5.h),
              Text(LocaleKeys.find_password_content2.tr()),
              SizedBox(height: 20.h),
              BlocBuilder<FindCubit, FindState>(
                builder: (context, state) => Container(
                  width: double.infinity,
                  height: 250.h,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: questionList(
                        list: context.read<AuthCubit>().userInfoList,
                        tapEvent: (UserInfo data) => context.read<FindCubit>().userselectEvent(data: data),
                        selectdUserInfo: state.selectdUserInfo,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              BlocBuilder<FindCubit, FindState>(
                builder: (context, state) => (state.selectdUserInfo != null)
                    ? Column(
                        children: [
                          Text(LocaleKeys.find_password_content3.tr()),
                          SizedBox(height: 10.h),
                          CustomTextForm(
                            controller: answerController,
                            name: LocaleKeys.find_password_title.tr(),
                            hintText: '',
                            maxLength: 20,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 10.h),
                          ElevatedButton(
                            onPressed: () async {
                              bool result = await context.read<FindCubit>().answerCheck(str: answerController.text);

                              if (result) {
                                context.read<AuthCubit>().moveToFindPasswordCompletePage();
                              } else {
                                wrongModal();
                              }
                            },
                            child: Text(LocaleKeys.common_ok.tr()),
                          ),
                        ],
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> questionList({required List<UserInfo> list, required ValueCallback<UserInfo> tapEvent, UserInfo? selectdUserInfo}) {
    List<Widget> result = [];

    if (list.isEmpty) {
      result.add(const Text('not Data'));
    } else {
      for (UserInfo data in list) {
        result.add(FindInfoComponent(
          info: data,
          tapEvent: tapEvent,
          selectdUserInfo: selectdUserInfo,
        ));
      }
    }

    return result;
  }

  Future<void> wrongModal() async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: LocaleKeys.modal_fail.tr(),
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }
}
