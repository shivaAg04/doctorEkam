import 'package:intl/intl.dart';

class Util {
  static String formatDate(String inputDate) {
    // Parse the input date string
    DateTime date = DateTime.parse(inputDate);

    // Define the desired output format
    final DateFormat formatter = DateFormat('MMM d, y');

    // Format the date
    String formattedDate = formatter.format(date);

    return formattedDate;
  }

  static String timeshortner(String time) {
    String shortTime = time.substring(0, 5);
    return shortTime;
  }
}
