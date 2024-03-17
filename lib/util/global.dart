import 'dart:ui';

import 'package:logger/logger.dart';

typedef ValueCallback<T> = void Function(T value);
typedef ValueCallback2<T, U> = void Function(T value1, U value2);
typedef ValueCallback3<T, Y, U> = void Function(T value1, Y value2, U value3);

final Logger logger = Logger(
  printer: PrettyPrinter(),
);

abstract class Global {
  static final supportedLocales = [
    const Locale('en', 'US'),
    const Locale('ko', 'KR'),
  ];
}
