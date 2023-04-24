import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(String isoDateString) {
    DateTime dateTimeUtc = DateTime.parse(isoDateString).toUtc();
    DateFormat format = DateFormat('EEEE - HH:mm');
    String formattedDate = format.format(dateTimeUtc);
    return formattedDate;
  }

  static String getMonthAndDay(String isoDateString) {
    DateTime dateTimeUtc = DateTime.parse(isoDateString).toUtc();
    DateFormat format = DateFormat('EEEE, dd MMMM yyyy');
    String formattedDate = format.format(dateTimeUtc);
    return formattedDate;
  }

  static String getTime(String isoDateString) {
    DateTime dateTimeUtc = DateTime.parse(isoDateString).toUtc();
    DateFormat format = DateFormat('HH:mm');
    String formattedDate = format.format(dateTimeUtc);
    return formattedDate;
  }

  static bool isEventIncoming(String isoDateString) {
    DateTime eventTime = DateTime.parse(isoDateString);
    DateTime currentTime = DateTime.now();
    return eventTime.isAfter(currentTime);
  }
}
