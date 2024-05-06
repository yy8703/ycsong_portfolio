import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_portfolio/bloc/global/main/main_cubit.dart';
import 'package:flutter_my_portfolio/data/chart/accomplishment_rate_bar_data.dart';
import 'package:flutter_my_portfolio/data/chart/calorie_bar_data.dart';
import 'package:flutter_my_portfolio/data/chart/linear_gradient_bar_data.dart';
import 'package:flutter_my_portfolio/data/chart/normal_bar_data.dart';
import 'package:flutter_my_portfolio/data/chart/progress_circle_data.dart';
import 'package:flutter_my_portfolio/generated/locale_keys.g.dart';
import 'package:flutter_my_portfolio/ui/fragments/chart/accomplishment_rate_chart.dart';
import 'package:flutter_my_portfolio/ui/fragments/chart/bar_chart.dart';
import 'package:flutter_my_portfolio/ui/fragments/chart/bar_three_chart.dart';
import 'package:flutter_my_portfolio/ui/fragments/chart/group_nutrition_chart.dart';
import 'package:flutter_my_portfolio/ui/fragments/chart/group_sleep_pie_chart.dart';
import 'package:flutter_my_portfolio/ui/fragments/chart/linear_gradient_bar_chart.dart';
import 'package:flutter_my_portfolio/ui/fragments/chart/linear_gradient_bar_three_chart.dart';
import 'package:flutter_my_portfolio/ui/fragments/chart/result_accomplishment_rate_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartMainPage extends StatefulWidget {
  static const String routePath = '/main/chart_main_page';

  const ChartMainPage({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    assert(settings.name == routePath);

    return MaterialPageRoute(builder: (BuildContext context) => const ChartMainPage());
  }

  @override
  _ChartMainPageState createState() => _ChartMainPageState();
}

class _ChartMainPageState extends State<ChartMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.main_page_chart.tr()),
        actions: [
          IconButton(onPressed: () => context.read<MainCubit>().movoToMainPage(), icon: const Icon(Icons.arrow_back_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const LinearGradientBarChart(
              chartWidth: 130,
              chartHeight: 200,
              startBar: LinearGradientBarData(
                value: 0,
                unitText: 'X',
                barValue: 0.5,
                averageValue: 0.25,
                topBarValue: 0.25,
                bottomBarValue: 0.25,
                topBarColor: Colors.grey,
                bottomBarColor: Colors.blueGrey,
                dateText: '03/01',
              ),
              objectiveBar: LinearGradientBarData(
                value: 0,
                unitText: 'Y',
                barValue: 0.5,
                averageValue: 0.25,
                topBarValue: 0.25,
                bottomBarValue: 0.25,
                topBarColor: Color.fromRGBO(255, 95, 87, 1),
                bottomBarColor: Color.fromRGBO(255, 95, 87, 0.7),
                dateText: '09/01',
              ),
            ),
            SizedBox(height: 20.h),
            const LinearGradientBarThreeChart(
              chartWidth: 270,
              chartHeight: 200,
              startBar: LinearGradientBarData(
                value: 0,
                unitText: 'kg/㎡',
                barValue: 1,
                averageValue: 0,
                bottomBarValue: 0.5,
                topBarValue: 0.5,
                topBarColor: Colors.grey,
                bottomBarColor: Colors.blueGrey,
                dateText: '03/01',
              ),
              endBar: LinearGradientBarData(
                value: 0,
                unitText: 'X',
                barValue: 0.5,
                averageValue: 0,
                bottomBarValue: 0,
                topBarValue: 0.5,
                topBarColor: Color.fromRGBO(8, 191, 116, 1),
                bottomBarColor: Color.fromRGBO(8, 191, 116, 0.7),
                dateText: '06/01',
              ),
              objectiveBar: LinearGradientBarData(
                value: 0,
                unitText: 'Y',
                barValue: 0.7,
                averageValue: 0,
                bottomBarValue: 0.5,
                topBarValue: 0.2,
                topBarColor: Color.fromRGBO(35, 122, 238, 1),
                bottomBarColor: Color.fromRGBO(35, 122, 238, 0.7),
                dateText: '목표',
              ),
            ),
            SizedBox(height: 20.h),
            const BarChart(
              chartWidth: 130,
              chartHeight: 200,
              meBar: NormalBarData(valueText: '100', unitText: 'kg/㎡', barValue: 0.5, barColor: Color.fromRGBO(35, 122, 238, 1), bottomText: '나'),
              sameBar: NormalBarData(valueText: '100', unitText: 'kg/㎡', barValue: 0.5, barColor: Color.fromRGBO(100, 161, 243, 0.7), bottomText: '비교군'),
            ),
            SizedBox(height: 20.h),
            const BarThreeChart(
              chartWidth: 260,
              chartHeight: 200,
              childCalorieBar: NormalBarData(
                valueText: '100',
                barValue: 0.5,
                barColor: Color.fromRGBO(35, 122, 238, 1),
                bottomText: '소모Kcal',
              ),
              groupCalorieBar: NormalBarData(
                valueText: '100',
                barValue: 0.5,
                barColor: Color.fromRGBO(100, 161, 243, 0.7),
                bottomText: '소모Kcal',
              ),
              childExerciseTimeBar: NormalBarData(
                valueText: '100',
                barValue: 0.5,
                barColor: Color.fromRGBO(35, 122, 238, 1),
                bottomText: '운동시간(분)',
              ),
              groupExerciseTimeBar: NormalBarData(
                valueText: '100',
                barValue: 0.5,
                barColor: Color.fromRGBO(100, 161, 243, 0.7),
                bottomText: '운동시간(분)',
              ),
              childStepBar: NormalBarData(
                valueText: '100',
                barValue: 0.5,
                barColor: Color.fromRGBO(35, 122, 238, 1),
                bottomText: '걸음수',
              ),
              groupStepBar: NormalBarData(
                valueText: '100',
                barValue: 0.5,
                barColor: Color.fromRGBO(100, 161, 243, 0.7),
                bottomText: '걸음수',
              ),
            ),
            SizedBox(height: 20.h),
            const AccomplishmentRateChart(
              chartWidth: 300,
              chartHeight: 200,
              exerciseAccomplishmentRateBar: AccomplishmentRateBarData(barTitle: '운동', barValue: 0.3, barStateText: '부족'),
              sleepAccomplishmentRateBar: AccomplishmentRateBarData(barTitle: '수면', barValue: 0.5, barStateText: '보통'),
              nutritionAccomplishmentRateBar: AccomplishmentRateBarData(barTitle: '영양', barValue: 0.7, barStateText: '좋음'),
            ),
            SizedBox(height: 20.h),
            const ResultAccomplishmentRateChart(
              chartWidth: 300,
              totalAccomplishmentRateBar: AccomplishmentRateBarData(barTitle: 'Title1', barValue: 0.2, barStateText: ''),
              exerciseAccomplishmentRateBar: AccomplishmentRateBarData(barTitle: 'Title2', barValue: 0.4, barStateText: ''),
              sleepAccomplishmentRateBar: AccomplishmentRateBarData(barTitle: 'Title3', barValue: 0.6, barStateText: ''),
              nutritionAccomplishmentRateBar: AccomplishmentRateBarData(barTitle: 'Title4', barValue: 0.8, barStateText: ''),
            ),
            SizedBox(height: 20.h),
            const GroupSleepPieChart(
              chartWidth: 300,
              circleRadius: 70,
              childSleepPieChart: ProgressCircleData(
                order: 1,
                progressColor: Colors.lightBlue,
                progressStartHour: 22,
                progressStartMinute: 30,
                progressTimeHour: 6,
                progressTimeMinute: 30,
              ),
              groupSleepPieChart: ProgressCircleData(
                order: 1,
                progressColor: Colors.lightGreen,
                progressStartHour: 10,
                progressStartMinute: 0,
                progressTimeHour: 6,
                progressTimeMinute: 30,
              ),
            ),
            SizedBox(height: 20.h),
            const GroupNutritionChart(
              chartWidth: 300,
              childCalorieBarData: CalorieBarData(
                barTitle: '자녀',
                morningValue: 500,
                morningBarValue: 0.25,
                lunchValue: 500,
                lunchBarValue: 0.25,
                dinnerValue: 500,
                dinnerBarValue: 0.25,
                snackValue: 500,
                snackBarValue: 0.25,
                totalCalorieValue: 2000,
              ),
              groupCalorieBarData: CalorieBarData(
                barTitle: '그룹군',
                morningValue: 333,
                morningBarValue: 0.25,
                lunchValue: 333,
                lunchBarValue: 0.25,
                dinnerValue: 333,
                dinnerBarValue: 0.25,
                snackValue: 333,
                snackBarValue: 0.25,
                totalCalorieValue: 1000,
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
