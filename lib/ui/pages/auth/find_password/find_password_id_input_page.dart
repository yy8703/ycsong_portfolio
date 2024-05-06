import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/bloc/local/find/find_cubit.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/components/modal/instant_modal.dart';
import 'package:flutter_my_portfolio/ui/components/text_form/custom_text_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindPasswordIdInputPage extends StatefulWidget {
  static const String routePath = '/auth/find_password_id_input_page';

  const FindPasswordIdInputPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const FindPasswordIdInputPage());
  }

  @override
  _FindPasswordIdInputPageState createState() => _FindPasswordIdInputPageState();
}

class _FindPasswordIdInputPageState extends State<FindPasswordIdInputPage> {
  TextEditingController idController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ///페이지 진입시 초기화
    context.read<FindCubit>().userselectEvent(data: null);
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(LocaleKeys.find_password_id_content.tr()),
            SizedBox(height: 20.h),
            CustomTextForm(
              controller: idController,
              name: LocaleKeys.find_password_title.tr(),
              hintText: LocaleKeys.find_password_id_content.tr(),
              maxLength: 20,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () async {
                bool result = await context.read<FindCubit>().findPasswordIdCheck(str: idController.text);

                if (result) {
                  context.read<AuthCubit>().moveToFindPasswordPage();
                } else {
                  notIdModal();
                }
              },
              child: Text(LocaleKeys.common_ok.tr()),
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
      modalText: LocaleKeys.find_password_not_id.tr(),
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }
}
