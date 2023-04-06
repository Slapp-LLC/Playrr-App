import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(String isoDateString) {
    DateTime dateTimeUtc = DateTime.parse(isoDateString).toUtc();
    DateFormat format = DateFormat('EEEE - HH:mm');
    String formattedDate = format.format(dateTimeUtc);
    return formattedDate;
  }
}
