import 'dart:ui';

import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(),
);

abstract class Global {
  static final supportedLocales = [
    const Locale('en', 'US'),
    const Locale('ko', 'KR'),
  ];
}
