
import 'package:intl/intl.dart';

class CustomDateUtils {

  static String formatDate(DateTime dateTime) {
    const weekdays = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
    final String weekday = weekdays[dateTime.weekday];
    String formattedDate = DateFormat('MM-dd').format(dateTime);
    return '$weekday,$formattedDate';
  }

}