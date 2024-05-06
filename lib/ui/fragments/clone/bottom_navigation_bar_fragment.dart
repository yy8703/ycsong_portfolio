import 'package:flutter/material.dart';
import 'package:flutter_my_portfolio/ui/components/clone/bottom_navigation_button.dart';
import 'package:flutter_my_portfolio/util/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarFragment extends StatelessWidget {
  const BottomNavigationBarFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavigationButton(
            icons: Icons.home_filled,
            color: CSSColor.kurlyMainColor,
            title: '홈',
          ),
          BottomNavigationButton(
            icons: Icons.coffee,
            color: Colors.grey,
            title: '라운지',
          ),
          BottomNavigationButton(
            icons: Icons.density_medium_rounded,
            color: Colors.grey,
            title: '카테고리',
          ),
          BottomNavigationButton(
            icons: Icons.search,
            color: Colors.grey,
            title: '검색',
          ),
          BottomNavigationButton(
            icons: Icons.person_2_outlined,
            color: Colors.grey,
            title: '마이컬리',
          ),
        ],
      ),
    );
  }
}
