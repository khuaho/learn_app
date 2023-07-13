import 'package:intl/intl.dart';

import '../gen/i18n.dart';

extension DateTimeExtension on DateTime {
  String formatDateTime(I18n i18n) {
    return '${(DateFormat.Hm('vi').format(this))} ${formatDate()}';
  }

  String formatDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String formatTime(I18n i18n) {
    return '${DateFormat.Hm('vi').format(this)} ';
  }

  bool isSameDayOrAfter(DateTime other) => isAfter(other) || isSameDay(other);

  bool isSameDayOrBefore(DateTime other) => isBefore(other) || isSameDay(other);

  bool isSameDay(DateTime? other) =>
      other != null &&
      year == other.year &&
      month == other.month &&
      day == other.day;

  bool isBetweenDays(DateTime? start, DateTime? end) {
    var isAfterStartDay = start != null ? isSameDayOrAfter(start) : true;
    var isBeforeEndDay = end != null ? isSameDayOrBefore(end) : true;

    return isAfterStartDay && isBeforeEndDay;
  }

  bool isTimeBefore(DateTime other) =>
      hour < other.hour || (hour == other.hour && minute < other.minute);

  bool isSameTimeOrBefore(DateTime other) =>
      isTimeBefore(other) || (hour == other.hour && minute == other.minute);

  DateTime combineTime(DateTime other) =>
      DateTime(year, month, day, other.hour, other.minute, other.second);

  // DateTime setTime([
  //   int hour = 0,
  //   int minute = 0,
  //   int second = 0,
  //   int millisecond = 0,
  //   int microsecond = 0,
  // ]) =>
  //     DateTime(
  //         year, month, day, hour, minute, second, millisecond, microsecond);

  // String timeAgoCustom(I18n i18n) {
  //   final year = '${i18n.notification_Year} ${i18n.notification_Ago}';
  //   final month = '${i18n.notification_Month} ${i18n.notification_Ago}';
  //   final week = '${i18n.notification_Week} ${i18n.notification_Ago}';
  //   final hour = '${i18n.notification_Hour} ${i18n.notification_Ago}';
  //   final minute = '${i18n.notification_Minute} ${i18n.notification_Ago}';

  //   Duration diff = DateTime.now().difference(this);
  //   if (diff.inDays > 365) {
  //     return '${(diff.inDays / 365).floor()} $year';
  //   }
  //   if (diff.inDays > 30) {
  //     return '${(diff.inDays / 30).floor()} $month';
  //   }
  //   if (diff.inDays > 7) {
  //     return '${(diff.inDays / 7).floor()} $week';
  //   }
  //   if (diff.inDays > 0) {
  //     return DateFormat.EEEE(I18n.locale?.languageCode)
  //         .add_jm()
  //         .format(this)
  //         .toString();
  //   }
  //   if (diff.inHours > 0) {
  //     return '${diff.inHours} $hour';
  //   }
  //   if (diff.inMinutes > 0) {
  //     return '${diff.inMinutes} $minute';
  //   }
  //   return i18n.notification_JustNow;
  // }
}
