import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/clone/clone_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/clone/clone_state.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_cubit.dart';
import 'package:flutter_my_portfolio/data/types.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/bottom_navigation_bar_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/tap_bar_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/tap_bast_content_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/tap_gift_ranking_content_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/tap_main_content_fragment.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KurlyMainPage extends StatefulWidget {
  static const String routePath = '/main/kurly_main_page';

  const KurlyMainPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const KurlyMainPage());
  }

  @override
  _KurlyMainPageState createState() => _KurlyMainPageState();
}

class _KurlyMainPageState extends State<KurlyMainPage> {
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<MainCubit>().movoToMainPage();
        return false;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              BlocBuilder<CloneCubit, CloneState>(builder: (context, state) {
                Widget result = Container();
                switch (state.tapTitle) {
                  case TapTitle.Main:
                    result = TapMainContentFragment(
                      carouselController: carouselController,
                      popUpDataList: state.popUpDataList,
                      popUpOnTap: (value) => context.read<CloneCubit>().tapChangeEvent(value: value),
                      onPageChanged: (index) => context.read<CloneCubit>().popUpChangeEvent(index: index),
                      popUpViewIndex: state.popUpViewIndex,
                      itemDataList: state.itemDataList,
                    );
                    break;
                  case TapTitle.GiftRanking:
                    result = TapGiftRankingContentFragment(
                      itemDataList: state.itemDataList,
                    );
                    break;
                  case TapTitle.Best:
                    result = TapBastContentFragment(
                      selectedButtonNumber: state.alignOrder,
                      itemDataList: state.alignItemList(),
                      alignEvent: (value) => context.read<CloneCubit>().alignEvent(value: value),
                    );
                    break;
                  case TapTitle.NewProduct:
                    break;
                  case TapTitle.AffordableShopping:
                    break;
                  case TapTitle.SpecialOffer_Benefit:
                    break;
                }

                return result;
              }),

              ///app bar area start - 130.h
              SizedBox(
                width: double.infinity,
                height: 130.h,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
                      color: CSSColor.kurlyMainColor,
                      child: Row(
                        children: [
                          SizedBox(width: 10.w),
                          Image.asset(
                            'assets/images/clone/logo.png',
                            width: 70.w,
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: 80.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              '마켓컬리',
                              style: TextStyle(color: CSSColor.kurlyMainColor, fontSize: 17.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.message_outlined,
                                size: 30.w,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.w),
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 30.w,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: BlocBuilder<CloneCubit, CloneState>(
                            builder: (context, state) => TapBarFragment(
                              list: state.tapBarDataList,
                              tapTitle: state.tapTitle,
                              onTapEvent: (value) => context.read<CloneCubit>().tapChangeEvent(value: value),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //app bar area end - 130.h
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarFragment(),
      ),
    );
  }
}
