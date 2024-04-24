import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/local/rest_api/rest_api_cubit.dart';
import 'package:flutter_my_portfolio/bloc/local/rest_api/rest_api_state.dart';
import 'package:flutter_my_portfolio/data/rest_api/address.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/repository/rest_api_repository.dart';
import 'package:flutter_my_portfolio/ui/components/text_form/custom_text_form.dart';
import 'package:flutter_my_portfolio/ui/fragments/rest_api/address_area.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestApiMainPage extends StatefulWidget {
  static const String routePath = '/main/rest_api_main_page';

  const RestApiMainPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const RestApiMainPage());
  }

  @override
  _RestApiMainPageState createState() => _RestApiMainPageState();
}

class _RestApiMainPageState extends State<RestApiMainPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestApiCubit>(
          create: (BuildContext context) => RestApiCubit(
            restApiRepository: RepositoryProvider.of<RestApiRepository>(context),
          ),
        ),
      ],
      child: const AddRestApiMainPage(),
    );
  }
}

class AddRestApiMainPage extends StatefulWidget {
  const AddRestApiMainPage({super.key});

  @override
  _AddRestApiMainPageState createState() => _AddRestApiMainPageState();
}

class _AddRestApiMainPageState extends State<AddRestApiMainPage> {
  TextEditingController adressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.rest_api_page_title.tr()),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50.h,
                    child: CustomTextForm(
                      controller: adressController,
                      name: 'adress',
                      hintText: LocaleKeys.rest_api_page_hint_text.tr(),
                      maxLength: 40,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                ElevatedButton(
                  onPressed: () => context.read<RestApiCubit>().addressSearchEvent(inputAddress: adressController.text),
                  child: Text(LocaleKeys.rest_api_page_search.tr()),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            BlocBuilder<RestApiCubit, RestApiState>(
              builder: (context, state) => Text('${LocaleKeys.rest_api_page_choice_address.tr()} : ${state.address?.addressName}\n'),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<RestApiCubit, RestApiState>(
              builder: (context, state) => Expanded(
                child: AddressArea(
                  addressMeta: state.addressMeta,
                  addressList: state.addressList,
                  addressAreaScrollEvent: () => context.read<RestApiCubit>().addressScrollSearchEvent(inputAddress: adressController.text),
                  selectAddressReturnEvent: (Address address) => context.read<RestApiCubit>().selectAddressEvent(data: address),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
