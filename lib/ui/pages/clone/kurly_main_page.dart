import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/clone/clone_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/clone/clone_state.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_cubit.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/bottom_navigation_bar_fragment.dart';
import 'package:flutter_my_portfolio/ui/fragments/clone/tap_bar_fragment.dart';
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 130.h),
                    BlocBuilder<CloneCubit, CloneState>(
                      builder: (context, state) => Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 300.h,
                            child: CarouselSlider.builder(
                                carouselController: carouselController,
                                itemCount: state.popUpDataList.length,
                                itemBuilder: (context, index, realIndex) => Image.asset(
                                      state.popUpDataList[index].imageLink,
                                      fit: BoxFit.fill,
                                    ),
                                options: CarouselOptions(
                                  initialPage: 0,
                                  height: double.infinity,
                                  viewportFraction: 1,
                                  autoPlay: true,
                                  enableInfiniteScroll: true,
                                  autoPlayInterval: const Duration(milliseconds: 4000),
                                  onPageChanged: (index, reason) => context.read<CloneCubit>().popUpChangeEvent(index: index),
                                )),
                          ),
                          Positioned(
                            bottom: 15.h,
                            right: 25.w,
                            child: Container(
                              width: 60.w,
                              height: 18.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: const Color.fromRGBO(155, 155, 155, 0.3), borderRadius: BorderRadius.circular(10.r)),
                              child: Text(
                                '${state.popUpViewIndex + 1}/${state.popUpDataList.length}',
                                style: TextStyle(color: Colors.white, fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '지금 가장 많이 담는 특가',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '전체보기 ',
                                    style: TextStyle(
                                      color: CSSColor.kurlyMainColor,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: CSSColor.kurlyMainColor,
                                    size: 17.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '컬리 추천 특가템 최대 30%',
                            style: TextStyle(color: Colors.grey, fontSize: 17.sp),
                          ),
                          SizedBox(height: 10.h),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 160.w,
                                      height: 180.h,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Container(
                                      width: 160.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1.5.w,
                                        ),
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.shopping_cart_outlined,
                                            size: 16.sp,
                                          ),
                                          SizedBox(width: 5.w),
                                          Text(
                                            '담기',
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      width: 160.w,
                                      child: Text('상품명상품명상품명상품명상품명상품명상품명상품명상품명aaa', style: TextStyle(fontSize: 14.sp), overflow: TextOverflow.ellipsis, maxLines: 2),
                                    ),
                                    SizedBox(height: 5.h),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Text(
                                          '${Global.moneyFormat.format(14500)}원',
                                          style: TextStyle(color: Colors.grey.shade400, fontSize: 13.sp),
                                        ),
                                        Container(
                                          width: 50.w,
                                          height: 1.h,
                                          color: Colors.grey.shade400,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2.h),
                                    Row(
                                      children: [
                                        Text(
                                          '24%',
                                          style: TextStyle(color: Colors.orange.shade800, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          '${Global.moneyFormat.format(14500)}원',
                                          style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.chat_outlined,
                                          size: 13.sp,
                                          color: Colors.grey.shade400,
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          '24',
                                          style: TextStyle(color: Colors.grey.shade400, fontSize: 13.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                Container(
                                  width: 160.w,
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Container(
                                  width: 160.w,
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 500.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

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
                              seletedTapBarTitle: state.seletedTapBarTitle,
                              onTapEvent: (value) => context.read<CloneCubit>().tapBarOnTabEvent(title: value),
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
