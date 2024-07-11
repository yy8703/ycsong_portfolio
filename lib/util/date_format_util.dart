import 'package:easy_localization/easy_localization.dart';

class DateFormatUtil {
  static final DateFormat YEAR_DATE_YYYY_MM_DD_HHMMSS = DateFormat('yyyy-MM-dd HH:mm:ss', 'en_US');
  static final DateFormat YEAR_DATE_YYYY_MM_DD_HHMMSSZ = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ", 'en_US');
}
