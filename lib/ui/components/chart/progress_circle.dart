import 'dart:math';

import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  ///
  const ProgressCircle({
    super.key,
    required this.radius,
    required this.backCircleColor,
    required this.progressColor,
    required this.progressStartHour,
    required this.progressStartMinute,
    required this.progressTimeHour,
    required this.progressTimeMinute,
  });

  ///크기
  final double radius;

  ///뒷녀석 게이지 색상
  final Color backCircleColor;

  ///TODO :: 여기서부터
  ///
  ///프로그래스 컬러
  final Color progressColor;

  ///시작 시간
  final int progressStartHour;

  ///시작 분
  final int progressStartMinute;

  ///시간
  final int progressTimeHour;

  ///분
  final int progressTimeMinute;

  ///TODO :: 여기까지 리스트로 만들기

  @override
  Widget build(BuildContext context) {
    Size size = Size(radius, radius);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: Painter(
          backCircleColor: backCircleColor,
          progressColor: progressColor,
          progressStartHour: progressStartHour,
          progressStartMinute: progressStartMinute,
          progressTimeHour: progressTimeHour,
          progressTimeMinute: progressTimeMinute,
        ),
      ),
    );
  }
}

///
class Painter extends CustomPainter {
  ///
  Painter({
    required this.backCircleColor,
    required this.progressColor,
    required this.progressStartHour,
    required this.progressStartMinute,
    required this.progressTimeHour,
    required this.progressTimeMinute,
  });

  ///
  final Color backCircleColor;

  ///
  final Color progressColor;

  ///
  final int progressStartHour;

  ///
  final int progressStartMinute;

  ///
  final int progressTimeHour;

  ///
  final int progressTimeMinute;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    final Rect rect = Rect.fromCircle(radius: radius, center: center);
    drawBackground(canvas: canvas, center: center, radius: radius, backGroundColor: backCircleColor);

    ///계산식 ::
    ///1. 조각의 시작시간을(분단위) 구합니다 (circle 시작점을 조정 -180)
    ///2. 활동시간을 구합니다
    ///3. 시작시간-분 > 시작 각도로 변환, 활동시간-분 > 끝 각도로 변환
    ///4. 시작 각도와 끝 각도를 넘깁니다
    ///5. 아무튼 완성
    int progressStartTime = (calculateTime(hour: progressStartHour, minute: progressStartMinute) - 180);
    int progressStartTimeMinute = calculateTime(hour: progressTimeHour, minute: progressTimeMinute);

    double startAngle = convertAngle(minute: progressStartTime);
    double sweepAngle = convertAngle(minute: progressStartTimeMinute);

    drawPie(
      canvas: canvas,
      rect: rect,
      progressColor: progressColor,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );
  }

  ///뒷배경 그리기
  void drawBackground({required Canvas canvas, required Offset center, required double radius, required Color backGroundColor}) {
    Paint paint1 = Paint()
      ..color = backGroundColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paint1);
  }

  ///pie 그리기

  void drawPie({required Canvas canvas, required Rect rect, required Color progressColor, required double startAngle, required double sweepAngle}) {
    final Paint circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = progressColor;

    ///200% 기준,,
    ///1 == 6
    ///0.5 == 3
    canvas.drawArc(rect, startAngle, sweepAngle, true, circlePaint);
  }

  ///시간계산
  int calculateTime({required int hour, required int minute}) {
    int time = 0;

    time = (hour * 60) + minute;

    return time;
  }

  ///시간 각도 변환
  double convertAngle({required int minute}) {
    return pi * (minute / 360);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
