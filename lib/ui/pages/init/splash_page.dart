import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/init/app_init_cubit.dart';
import 'package:flutter_my_portfolio/bloc/global/init/app_init_state.dart';
import 'package:flutter_my_portfolio/data/types.dart';
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

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
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

    nameAnimation = Tween<double>(begin: 0, end: 1).animate(nameAnimationController);
    titleAnimation = Tween<double>(begin: 0, end: 1).animate(titleAnimationController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        titleAnimationController.forward();
        nameAnimationController.forward().then(
              (value) => Future.delayed(
                const Duration(milliseconds: 1000),
                () => context.read<AppInitCubit>().appInitializerProcess(step: AppInitializerStep.STEP_1),
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
        child: BlocConsumer<AppInitCubit, AppInitState>(
          listener: (context, state) async {
            switch (state.processState) {
              case AppInitializerProcessState.notLocationPermission:
                await context.read<AppInitCubit>().requestLocationPermission();
                context.read<AppInitCubit>().appInitializerProcess(step: AppInitializerStep.STEP_2);
                break;
              case AppInitializerProcessState.setLocale:
                Locale? locale = context.read<AppInitCubit>().locale;
                if (locale != null) {
                  context.setLocale(locale);
                }
                context.read<AppInitCubit>().appInitializerProcess(step: AppInitializerStep.STEP_3);
                break;
              default:
                break;
            }
          },
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: nameAnimation,
                child: Text(
                  'YC SONG',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              FadeTransition(
                opacity: titleAnimation,
                child: Text(
                  'My Portfolio',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
