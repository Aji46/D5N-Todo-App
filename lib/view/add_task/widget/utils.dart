
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  DateTime today = DateTime.now();
  DateTime tomorrow = today.add(const Duration(days: 1));

  if (date.year == today.year && date.month == today.month && date.day == today.day) {
    return 'Today';
  } else if (date.year == tomorrow.year && date.month == tomorrow.month && date.day == tomorrow.day) {
    return 'Tomorrow';
  }

  return DateFormat('EEE, MMM dd, yyyy', 'en_US').format(date);
}