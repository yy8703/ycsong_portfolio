import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KurlySecondarySplashPage extends StatefulWidget {
  static const String routePath = '/main/kurly_secondary_splash_page';

  const KurlySecondarySplashPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const KurlySecondarySplashPage());
  }

  @override
  _KurlySecondarySplashPageState createState() => _KurlySecondarySplashPageState();
}

class _KurlySecondarySplashPageState extends State<KurlySecondarySplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 2000), () => context.read<MainCubit>().moveToKurlyMainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(173, 175, 214, 1),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'KURLY MEMBERS',
              style: TextStyle(color: const Color.fromRGBO(54, 109, 173, 1), fontWeight: FontWeight.bold, fontSize: 25.sp),
            ),
            SizedBox(height: 15.h),
            Text(
              '기간 한정! 컬리멤버스\n혜택이 더 커졌어요!',
              style: TextStyle(color: const Color.fromRGBO(14, 0, 24, 1), fontWeight: FontWeight.bold, fontSize: 35.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.h),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  width: 111.5.w,
                  height: 13.h,
                  color: const Color.fromRGBO(54, 109, 173, 0.3),
                ),
                Text(
                  '3개월 무료 혜택으로\n바로 시작해 보세요',
                  style: TextStyle(color: const Color.fromRGBO(14, 0, 24, 1), fontSize: 20.sp),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Image.asset('assets/images/clone/splash_image.png'),
          ],
        ),
      ),
    );
  }
}
