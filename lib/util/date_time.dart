import 'package:intl/intl.dart';

String extractTime(dateTimeString) {
  List<String> parts = dateTimeString.split(" ");
  String timePart = parts[1];
  List<String> timeParts = timePart.split(":");
  String hour = timeParts[0];
  String minute = timeParts[1];
  return '$hour:$minute';
}

String extractDay(dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formattedDayOfWeek = DateFormat.EEEE().format(dateTime);
  return formattedDayOfWeek;
}

String extractDayFromDateTime(dateTimeString) {
  DateTime dateTimeNow = DateTime.now();
  DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateTimeString);
  String apiDate = DateFormat('yyyy-MM-dd').format(dateTime);
  String nowDate = DateFormat('yyyy-MM-dd').format(dateTimeNow);
  if (apiDate == nowDate) {
    return 'Now';
  }
  return DateFormat.EEEE().format(dateTime);
}
