import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';

class CSSColor {
  static const Color kurlyMainColor = Color.fromRGBO(95, 0, 128, 1);
}

typedef ValueCallback<T> = void Function(T value);
typedef ValueCallback2<T, U> = void Function(T value1, U value2);
typedef ValueCallback3<T, Y, U> = void Function(T value1, Y value2, U value3);

final Logger logger = Logger(
  printer: PrettyPrinter(),
);

abstract class Global {
  static final NumberFormat moneyFormat = NumberFormat('###,###,###');
  static final supportedLocales = [
    const Locale('en', 'US'),
    const Locale('ko', 'KR'),
  ];
}
