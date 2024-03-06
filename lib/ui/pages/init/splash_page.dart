import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  static const String routePath = '/splash_page';

  const SplashPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const SplashPage(), settings: settings);
  }

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController nameAnimationController;
  late AnimationController titleAnimationController;
  late Animation<double> nameAnimation;
  late Animation<double> titleAnimation;

  @override
  void initState() {
    super.initState();
    nameAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    titleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    nameAnimation = Tween<double>(begin: 1.0, end: 0).animate(nameAnimationController);
    titleAnimation = Tween<double>(begin: 1.0, end: 0).animate(titleAnimationController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        nameAnimationController.forward().then(
              (value) => Future.delayed(
                const Duration(milliseconds: 1000),
                () {
                  //여기에 화면이동
                  titleAnimationController.forward().then((value) => null);
                },
              ),
            );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'YC SONG',
              style: TextStyle(fontSize: 20.w),
            ),
            Text(
              'My Portfolio',
              style: TextStyle(fontSize: 20.w),
            )
          ],
        ),
      ),
    );
  }
}
