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

  static String Datformat(String inputDate) {
    // Parse the input date string into a DateTime object
    DateTime date = DateTime.parse(inputDate);

    // Create a DateFormat object for the desired output format
    DateFormat formatter = DateFormat('MMM d');

    // Format the DateTime object as a string in the desired format
    String formattedDate = formatter.format(date);

    return formattedDate;
  }
}
