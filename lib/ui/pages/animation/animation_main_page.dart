import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_cubit.dart';
import 'package:flutter_my_portfolio/bloc/local/animation/animation_cubit.dart';
import 'package:flutter_my_portfolio/bloc/local/animation/animation_state.dart';
import 'package:flutter_my_portfolio/repository/animation_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationMainPage extends StatefulWidget {
  static const String routePath = '/main/animation_main_page';

  const AnimationMainPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const AnimationMainPage());
  }

  @override
  _AnimationMainPageState createState() => _AnimationMainPageState();
}

class _AnimationMainPageState extends State<AnimationMainPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AnimationCubit>(
          create: (BuildContext context) => AnimationCubit(
            animationRepository: RepositoryProvider.of<AnimationRepository>(context),
          ),
        ),
      ],
      child: const AddAnimationMainPage(),
    );
  }
}

class AddAnimationMainPage extends StatefulWidget {
  const AddAnimationMainPage({super.key});

  @override
  _AddAnimationMainPageState createState() => _AddAnimationMainPageState();
}

class _AddAnimationMainPageState extends State<AddAnimationMainPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AnimationCubit>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('애니메이션'),
        actions: [
          IconButton(onPressed: () => context.read<MainCubit>().movoToMainPage(), icon: const Icon(Icons.arrow_back_outlined)),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/animation/back_ground.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: BlocBuilder<AnimationCubit, AnimationState>(
          builder: (animationContext, animationState) => Stack(
            children: [
              AnimatedPositioned(
                curve: Curves.easeIn,
                bottom: animationState.animationFlag1 ? 80.h : -500.h,
                child: SizedBox(
                  width: 250.w,
                  height: 400.h,
                  child: Image.asset('assets/images/animation/character_1.png', fit: BoxFit.fill),
                ),
                duration: Duration(seconds: 1),
              ),
              AnimatedPositioned(
                curve: Curves.easeIn,
                bottom: animationState.animationFlag2 ? 80.h : -500.h,
                right: 0,
                child: SizedBox(
                  width: 250.w,
                  height: 400.h,
                  child: Image.asset('assets/images/animation/character_2.png', fit: BoxFit.fill),
                ),
                duration: Duration(seconds: 1),
              ),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                  child: Container(
                    width: 500.w,
                    height: 150.h,
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        DefaultTextStyle(
                          style: TextStyle(fontSize: 30.sp, color: Colors.white),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                '캐릭터1',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        DefaultTextStyle(
                          style: TextStyle(fontSize: 25.sp, color: Colors.white),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                '테스트테스트',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
