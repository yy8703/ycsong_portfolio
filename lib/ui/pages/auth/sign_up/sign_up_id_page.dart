import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/auth/auth_state.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/components/modal/instant_modal.dart';
import 'package:flutter_my_portfolio/ui/components/text_form/custom_text_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpIdPage extends StatefulWidget {
  static const String routePath = '/auth/sign_up_id_page';

  const SignUpIdPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SignUpIdPage(), settings: settings);
  }

  @override
  _SignUpIdPageState createState() => _SignUpIdPageState();
}

class _SignUpIdPageState extends State<SignUpIdPage> {
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_up_id_title.tr()),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            Text(LocaleKeys.sign_up_id_title.tr()),
            Text(LocaleKeys.sign_up_id_content.tr()),
            SizedBox(height: 30.h),
            Row(
              children: [
                CustomTextForm(
                  name: LocaleKeys.sign_up_id_title.tr(),
                  controller: idController,
                  hintText: LocaleKeys.sign_up_content_id_hint_text.tr(),
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  onChanged: (value) => context.read<AuthCubit>().idOnChangedEvent(value: value),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    if (idController.text.isNotEmpty) {
                      bool isIdOverLap = await context.read<AuthCubit>().idOverLapEvent(value: idController.text);

                      if (isIdOverLap) {
                        idOKModal();
                      } else {
                        isIdOverLapModal();
                      }
                    } else {
                      notIdModal();
                    }
                  },
                  child: Text(LocaleKeys.sign_up_content_id_over_lap.tr()),
                ),
              ],
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
                  if (state.idRegExpState?.isEnabled == false) {
                    notIdModal();
                  } else {
                    if (state.signUpDataDTO?.isIdOverLap == true) {
                      context.read<AuthCubit>().moveToMakePasswordPage();
                    } else if (state.signUpDataDTO?.isIdOverLap == false) {
                      isIdOverLapModal();
                    } else {
                      idOverLapCheckPlzModal();
                    }
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

  Future<void> idOKModal() async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: LocaleKeys.sign_up_content_id_use_ok.tr(),
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }

  Future<void> notIdModal() async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: LocaleKeys.sign_up_id_content.tr(),
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }

  Future<void> idOverLapCheckPlzModal() async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: LocaleKeys.sign_up_content_id_over_lap_plz.tr(),
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }

  Future<void> isIdOverLapModal() async {
    await showInstantModal<bool>(
      context,
      innerWidth: 280.w,
      innerHeight: 150.w,
      modalText: LocaleKeys.sign_up_content_id_is_over_lap.tr(),
      mainButtonOnTap: () => Navigator.pop(context),
    );
  }
}
