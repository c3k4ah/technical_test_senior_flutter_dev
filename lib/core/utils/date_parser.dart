import 'package:intl/intl.dart';

String dateParser(DateTime currentTime) {
  final String formatted = DateFormat.yMMMMEEEEd('fr_FR').format(currentTime);
  return formatted;
}

extension DateTimeExtension on DateTime {
  String get formatToHuman {
    return DateFormat.yMEd('fr_FR').format(this);
  }
}
