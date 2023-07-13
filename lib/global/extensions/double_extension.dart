import 'package:intl/intl.dart';

import '../gen/i18n.dart';

extension DoubleExt on double {
  String toStringWithNoZero() {
    return toStringAsFixed(this == toInt() ? 0 : 1);
  }

  String toStringLimitFractionDigits([int digits = 2]) {
    var format = '##0';
    if (digits > 0) {
      format += '.';
      format += List.generate(digits, (_) => '#').join();
    }
    return NumberFormat(format, I18n.locale?.languageCode).format(this);
  }

  String toStringWithHours(I18n i18n) {
    String result = '';
    if (this >= 168) {
      double week = this / 168;
      result = i18n.common_Plural_Week(
        week.toInt(),
        week.toStringLimitFractionDigits(),
      );
    } else if (this >= 24) {
      double day = this / 24;
      result = i18n.common_Plural_Day(
        day.toInt(),
        day.toStringLimitFractionDigits(),
      );
    } else {
      double hour = this;
      result = i18n.common_Plural_Hour(
        hour.toInt(),
        hour.toStringLimitFractionDigits(),
      );
    }

    return '$result ${i18n.course_ToComplete}';
  }
}
