import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_state.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/components/modal/instant_modal.dart';
import 'package:flutter_my_portfolio/ui/components/text_form/custom_text_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFindDataPage extends StatefulWidget {
  static const String routePath = '/auth/sign_up_find_data_page';

  const SignUpFindDataPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SignUpFindDataPage(), settings: settings);
  }

  @override
  _SignUpFindDataPageState createState() => _SignUpFindDataPageState();
}

class _SignUpFindDataPageState extends State<SignUpFindDataPage> {
  TextEditingController answerController = TextEditingController();
  TextEditingController findDataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_up_find_data_title.tr()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            Text(LocaleKeys.sign_up_find_data_content.tr()),
            SizedBox(height: 30.h),
            Text(LocaleKeys.sign_up_content_find_answer.tr()),
            CustomTextForm(
              name: LocaleKeys.sign_up_content_find_answer.tr(),
              controller: answerController,
              hintText: LocaleKeys.sign_up_content_find_answer_hint_text.tr(),
              keyboardType: TextInputType.visiblePassword,
              maxLength: 20,
              onChanged: (value) => context.read<AuthCubit>().findDataOnChangedEvent(answer: answerController.text, findData: findDataController.text),
              obscureText: true,
            ),
            SizedBox(height: 5.h),
            Text(LocaleKeys.sign_up_content_find_data.tr()),
            CustomTextForm(
              name: LocaleKeys.sign_up_content_find_data.tr(),
              controller: answerController,
              hintText: LocaleKeys.sign_up_content_find_data_hint_text.tr(),
              keyboardType: TextInputType.visiblePassword,
              maxLength: 20,
              onChanged: (value) => context.read<AuthCubit>().findDataOnChangedEvent(answer: answerController.text, findData: findDataController.text),
              obscureText: true,
            ),
            SizedBox(height: 30.h),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) => ElevatedButton(
                onPressed: () async {
                  if (state.findDataRegExpState != null && state.findDataRegExpState!.errorText.isEmpty) {
                    bool makeUserInfoState = await context.read<AuthCubit>().makeUserInfoAndSave();
                    if (makeUserInfoState) {
                      context.read<AuthCubit>().moveToSignUpCompletePage();
                    } else {
                      failErrorModal();
                    }
                  } else {
                    findDataErrorModal(content: state.findDataRegExpState!.errorText);
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

  Future<void> findDataErrorModal({required String content}) async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: content,
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }

  Future<void> failErrorModal() async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: LocaleKeys.modal_fail.tr(),
      mainButtonOnTap: () => context.read<AuthCubit>().moveToLoginPage(),
    );
  }
}
